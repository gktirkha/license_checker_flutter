import 'package:flutter_test/flutter_test.dart';
import 'package:license_checker_flutter/license_checker_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _appName = 'test_app';
const _jsonUrl = 'https://example.com/license.json';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<void> initWith(
    LicenseCheckerApiResponseModel mockApiResponse, {
    double rulesVersion = 1,
  }) {
    return LicenseCheckerFlutter.init(
      LicenseCheckerConfig(
        jsonURL: _jsonUrl,
        appName: _appName,
        rulesVersion: rulesVersion,
      ),
      mockApiResponse: mockApiResponse,
    );
  }

  group('checkStatus', () {
    test('invokes onPaid when status is PAID', () async {
      await initWith(
        LicenseCheckerApiResponseModel(
          apps: {
            _appName: LicenseCheckerPaymentModel(
              status: PaymentStatus.PAID,
              targetVersion: 1,
            ),
          },
        ),
      );

      LicenseCheckerPaymentModel? result;
      await LicenseCheckerFlutter.checkStatus(
        onException: (e) => fail('unexpected exception: $e'),
        onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
        onPaid: (model) => result = model,
      );

      expect(result, isNotNull);
      expect(result!.status, PaymentStatus.PAID);
    });

    test('invokes onUnPaid when status is UNPAID', () async {
      await initWith(
        LicenseCheckerApiResponseModel(
          apps: {
            _appName: LicenseCheckerPaymentModel(
              status: PaymentStatus.UNPAID,
              targetVersion: 1,
            ),
          },
        ),
      );

      var called = false;
      await LicenseCheckerFlutter.checkStatus(
        onException: (e) => fail('unexpected exception: $e'),
        onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
        onUnPaid: (model) => called = true,
      );

      expect(called, isTrue);
    });

    test('invokes onAppNotFound when the app is missing from apps', () async {
      await initWith(LicenseCheckerApiResponseModel(apps: {}));

      var called = false;
      await LicenseCheckerFlutter.checkStatus(
        onException: (e) => fail('unexpected exception: $e'),
        onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
        onAppNotFound: () => called = true,
      );

      expect(called, isTrue);
    });

    test('invokes onTargetVersionMisMatch when versions differ', () async {
      await initWith(
        LicenseCheckerApiResponseModel(
          apps: {
            _appName: LicenseCheckerPaymentModel(
              status: PaymentStatus.PAID,
              targetVersion: 2,
            ),
          },
        ),
      );

      double? mismatchedTargetVersion;
      await LicenseCheckerFlutter.checkStatus(
        onException: (e) => fail('unexpected exception: $e'),
        onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
        onTargetVersionMisMatch: (model, targetVersion, configuredVersion) {
          mismatchedTargetVersion = targetVersion;
        },
      );

      expect(mismatchedTargetVersion, 2);
    });

    test('routes UNKNOWN status through onException', () async {
      await initWith(
        LicenseCheckerApiResponseModel(
          apps: {
            _appName: LicenseCheckerPaymentModel(
              targetVersion: 1,
            ),
          },
        ),
      );

      LicenseCheckerFlutterException? captured;
      await LicenseCheckerFlutter.checkStatus(
        onException: (e) => captured = e,
        onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
      );

      expect(captured, isNotNull);
      expect(captured!.type, LicenseCheckerExceptionType.unknownPaymentStatus);
    });

    group('ALLOW_LIMITED_LAUNCHES', () {
      test('grants max_launch launches on the very first check', () async {
        await initWith(
          LicenseCheckerApiResponseModel(
            apps: {
              _appName: LicenseCheckerPaymentModel(
                status: PaymentStatus.ALLOW_LIMITED_LAUNCHES,
                targetVersion: 1,
                maxLaunch: 3,
              ),
            },
          ),
        );

        int? remaining;
        await LicenseCheckerFlutter.checkStatus(
          onException: (e) => fail('unexpected exception: $e'),
          onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
          onLimitedLaunch: (model, currentCount) => remaining = currentCount,
          onLimitedLaunchExceeded: (model) =>
              fail('should not be exceeded on first run'),
        );

        expect(remaining, 3);
      });

      test('fires onLimitedLaunchExceeded once launches run out', () async {
        final mockResponse = LicenseCheckerApiResponseModel(
          apps: {
            _appName: LicenseCheckerPaymentModel(
              status: PaymentStatus.ALLOW_LIMITED_LAUNCHES,
              targetVersion: 1,
              maxLaunch: 1,
            ),
          },
        );
        await initWith(mockResponse);

        // First check grants 1 launch, then auto-decrements it to 0.
        await LicenseCheckerFlutter.checkStatus(
          onException: (e) => fail('unexpected exception: $e'),
          onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
          onLimitedLaunch: (model, currentCount) {},
        );

        var exceeded = false;
        await LicenseCheckerFlutter.checkStatus(
          onException: (e) => fail('unexpected exception: $e'),
          onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
          onLimitedLaunchExceeded: (model) => exceeded = true,
          onLimitedLaunch: (model, currentCount) =>
              fail('should already be exceeded'),
        );

        expect(exceeded, isTrue);
      });
    });

    group('ON_TRIAL', () {
      test('invokes onTrial while within the trial period', () async {
        final expiry = DateTime.now().add(const Duration(days: 30));
        await initWith(
          LicenseCheckerApiResponseModel(
            apps: {
              _appName: LicenseCheckerPaymentModel(
                status: PaymentStatus.ON_TRIAL,
                targetVersion: 1,
                expireDateTime: expiry,
              ),
            },
          ),
        );

        var called = false;
        await LicenseCheckerFlutter.checkStatus(
          onException: (e) => fail('unexpected exception: $e'),
          onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
          onTrial: (model, expiryDate, warningDate) => called = true,
        );

        expect(called, isTrue);
      });

      test('invokes onTrialWarning inside the warning window', () async {
        final expiry = DateTime.now().add(const Duration(days: 1));
        final warning = DateTime.now().subtract(const Duration(days: 1));
        await initWith(
          LicenseCheckerApiResponseModel(
            apps: {
              _appName: LicenseCheckerPaymentModel(
                status: PaymentStatus.ON_TRIAL,
                targetVersion: 1,
                expireDateTime: expiry,
                warningDate: warning,
              ),
            },
          ),
        );

        var called = false;
        await LicenseCheckerFlutter.checkStatus(
          onException: (e) => fail('unexpected exception: $e'),
          onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
          onTrialWarning: (model, expiryDate, warningDate) => called = true,
        );

        expect(called, isTrue);
      });

      test('invokes onTrialEnded once the trial has expired', () async {
        final expiry = DateTime.now().subtract(const Duration(days: 1));
        await initWith(
          LicenseCheckerApiResponseModel(
            apps: {
              _appName: LicenseCheckerPaymentModel(
                status: PaymentStatus.ON_TRIAL,
                targetVersion: 1,
                expireDateTime: expiry,
              ),
            },
          ),
        );

        var called = false;
        await LicenseCheckerFlutter.checkStatus(
          onException: (e) => fail('unexpected exception: $e'),
          onUnhandled: (reason, model) => fail('unexpected unhandled: $reason'),
          onTrialEnded: (model, expiryDate) => called = true,
        );

        expect(called, isTrue);
      });
    });
  });
}
