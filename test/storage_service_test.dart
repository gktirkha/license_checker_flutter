import 'package:flutter_test/flutter_test.dart';
import 'package:license_checker_flutter/src/enums/payment_status.dart';
import 'package:license_checker_flutter/src/models/license_checker_api_response_model/license_checker_api_response_model.dart';
import 'package:license_checker_flutter/src/models/license_checker_config/license_checker_config.dart';
import 'package:license_checker_flutter/src/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<void> initStorage({String appName = 'app', double rulesVersion = 1}) {
    return StorageService.init(
      LicenseCheckerConfig(
        jsonURL: 'https://example.com/license.json',
        appName: appName,
        rulesVersion: rulesVersion,
      ),
    );
  }

  group('allowedLaunchCount', () {
    test('is null before it has ever been set', () async {
      await initStorage();
      expect(StorageService.allowedLaunchCount, isNull);
    });

    test('setAllowedLaunchCount persists the given count', () async {
      await initStorage();
      await StorageService.setAllowedLaunchCount(5);
      expect(StorageService.allowedLaunchCount, 5);
    });

    test('decrementCount reduces the count by one', () async {
      await initStorage();
      await StorageService.setAllowedLaunchCount(3);
      await StorageService.decrementCount();
      expect(StorageService.allowedLaunchCount, 2);
    });

    test('decrementCount is a no-op once the count reaches zero', () async {
      await initStorage();
      await StorageService.setAllowedLaunchCount(0);
      await StorageService.decrementCount();
      expect(StorageService.allowedLaunchCount, 0);
    });
  });

  group('paymentModel', () {
    test('is null when nothing has been stored', () async {
      await initStorage();
      expect(StorageService.paymentModel, isNull);
    });

    test('round-trips through setPaymentModel', () async {
      await initStorage();
      final model = LicenseCheckerPaymentModel(
        status: PaymentStatus.PAID,
        targetVersion: 3,
      );
      await StorageService.setPaymentModel(model);

      final stored = StorageService.paymentModel;
      expect(stored, isNotNull);
      expect(stored!.status, PaymentStatus.PAID);
      expect(stored.targetVersion, 3);
    });
  });

  group('_setConfig', () {
    test('clears stored data when the app name changes', () async {
      await initStorage(appName: 'app_one');
      await StorageService.setAllowedLaunchCount(7);

      await initStorage(appName: 'app_two');

      expect(StorageService.allowedLaunchCount, isNull);
    });

    test('clears stored data when the rules version increases', () async {
      await initStorage();
      await StorageService.setAllowedLaunchCount(7);

      await initStorage(rulesVersion: 2);

      expect(StorageService.allowedLaunchCount, isNull);
    });

    test('preserves stored data when config is unchanged', () async {
      await initStorage(appName: 'app_one');
      await StorageService.setAllowedLaunchCount(7);

      await initStorage(appName: 'app_one');

      expect(StorageService.allowedLaunchCount, 7);
    });
  });
}
