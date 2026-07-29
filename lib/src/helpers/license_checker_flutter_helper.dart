import '../models/license_checker_config/license_checker_config.dart';
import '../services/storage_service.dart';

class LicenseCheckerFlutterHelper {
  LicenseCheckerFlutterHelper._();

  static Future<bool> shouldCheckOnline(LicenseCheckerConfig config) async {
    final cachedPaymentModel = StorageService.paymentModel;

    if (cachedPaymentModel == null) {
      return true;
    }

    if (cachedPaymentModel.targetVersion != config.rulesVersion) {
      return true;
    }

    switch (cachedPaymentModel.status) {
      case .PAID:
        return cachedPaymentModel.shouldCheckAfterPaid;

      case .UNPAID:
        return true;

      case .ALLOW_LIMITED_LAUNCHES:
        return (StorageService.allowedLaunchCount <= 0);

      case .ON_TRIAL:
        if (cachedPaymentModel.checkDuringTrial == true) {
          return true;
        }
        final now = DateTime.now();
        final warningDate = cachedPaymentModel.warningDate;
        final expiryDate = cachedPaymentModel.expireDateTime;
        if (expiryDate == null || warningDate == null) {
          return true;
        }
        return (now.isAfter(warningDate) && now.isBefore(expiryDate)) ||
            now.isAfter(expiryDate);

      case .UNKNOWN:
        return true;
    }
  }
}
