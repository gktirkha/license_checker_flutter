import 'package:flutter_test/flutter_test.dart';
import 'package:license_checker_flutter/src/enums/payment_status.dart';
import 'package:license_checker_flutter/src/helpers/license_checker_flutter_helper.dart';
import 'package:license_checker_flutter/src/models/license_checker_api_response_model/license_checker_api_response_model.dart';
import 'package:license_checker_flutter/src/models/license_checker_config/license_checker_config.dart';
import 'package:license_checker_flutter/src/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final config = LicenseCheckerConfig(
    jsonURL: 'https://example.com/license.json',
    appName: 'app',
    rulesVersion: 1,
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init(config);
  });

  group('shouldCheckOnline', () {
    test('is true when nothing is cached yet', () async {
      expect(
        await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
        isTrue,
      );
    });

    test('is true when the cached target_version no longer matches', () async {
      await StorageService.setPaymentModel(
        LicenseCheckerPaymentModel(
          status: PaymentStatus.PAID,
          targetVersion: 99,
        ),
      );
      expect(
        await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
        isTrue,
      );
    });

    group('PAID', () {
      test('re-checks online when should_check_after_paid is true', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.PAID,
            targetVersion: 1,
            shouldCheckAfterPaid: true,
          ),
        );
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isTrue,
        );
      });

      test('trusts the cache when should_check_after_paid is false', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.PAID,
            targetVersion: 1,
          ),
        );
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isFalse,
        );
      });
    });

    test('UNPAID always re-checks online', () async {
      await StorageService.setPaymentModel(
        LicenseCheckerPaymentModel(
          status: PaymentStatus.UNPAID,
          targetVersion: 1,
        ),
      );
      expect(
        await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
        isTrue,
      );
    });

    group('ALLOW_LIMITED_LAUNCHES', () {
      test('re-checks online when the launch count was never set', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.ALLOW_LIMITED_LAUNCHES,
            targetVersion: 1,
          ),
        );
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isTrue,
        );
      });

      test('re-checks online once the launch count is exhausted', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.ALLOW_LIMITED_LAUNCHES,
            targetVersion: 1,
          ),
        );
        await StorageService.setAllowedLaunchCount(0);
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isTrue,
        );
      });

      test('trusts the cache while launches remain', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.ALLOW_LIMITED_LAUNCHES,
            targetVersion: 1,
          ),
        );
        await StorageService.setAllowedLaunchCount(5);
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isFalse,
        );
      });
    });

    group('ON_TRIAL', () {
      test('re-checks online when check_during_trial is true', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.ON_TRIAL,
            targetVersion: 1,
            checkDuringTrial: true,
            expireDateTime: DateTime.now().add(const Duration(days: 30)),
          ),
        );
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isTrue,
        );
      });

      test('trusts the cache before the warning window when '
          'check_during_trial is false', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.ON_TRIAL,
            targetVersion: 1,
            expireDateTime: DateTime.now().add(const Duration(days: 30)),
            warningDate: DateTime.now().add(const Duration(days: 20)),
          ),
        );
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isFalse,
        );
      });

      test('re-checks online once inside the warning window', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.ON_TRIAL,
            targetVersion: 1,
            expireDateTime: DateTime.now().add(const Duration(days: 1)),
            warningDate: DateTime.now().subtract(const Duration(days: 1)),
          ),
        );
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isTrue,
        );
      });

      test('re-checks online once the trial has expired', () async {
        await StorageService.setPaymentModel(
          LicenseCheckerPaymentModel(
            status: PaymentStatus.ON_TRIAL,
            targetVersion: 1,
            expireDateTime: DateTime.now().subtract(const Duration(days: 1)),
          ),
        );
        expect(
          await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
          isTrue,
        );
      });

      test(
        're-checks online when expire_date or warning_date is missing',
        () async {
          await StorageService.setPaymentModel(
            LicenseCheckerPaymentModel(
              status: PaymentStatus.ON_TRIAL,
              targetVersion: 1,
            ),
          );
          expect(
            await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
            isTrue,
          );
        },
      );
    });

    test('UNKNOWN status always re-checks online', () async {
      await StorageService.setPaymentModel(
        LicenseCheckerPaymentModel(targetVersion: 1),
      );
      expect(
        await LicenseCheckerFlutterHelper.shouldCheckOnline(config),
        isTrue,
      );
    });
  });
}
