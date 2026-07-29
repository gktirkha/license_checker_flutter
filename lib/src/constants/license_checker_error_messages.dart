sealed class LicenseCheckerErrorMessages {
  static String get configResolvedNull =>
      'LicenseCheckerFlutter.init failed: config resolved to null.';

  static String get initFailed => 'LicenseCheckerFlutter.init failed.';

  static String get storageInitFailed =>
      'StorageService.init failed to initialize shared preferences.';

  static String get readVersionFailed =>
      'StorageService failed to read the stored rules version.';

  static String get readAppNameFailed =>
      'StorageService failed to read the stored app name.';

  static String get writeVersionFailed =>
      'StorageService failed to persist the rules version.';

  static String get writeAppNameFailed =>
      'StorageService failed to persist the app name.';

  static String get readAllowedLaunchCountFailed =>
      'StorageService failed to read the allowed launch count.';

  static String get writeAllowedLaunchCountFailed =>
      'StorageService failed to persist the allowed launch count.';

  static String get clearAllowedLaunchCountFailed =>
      'StorageService failed to clear the allowed launch count.';

  static String get readPaymentModelFailed =>
      'StorageService failed to read the stored payment model.';

  static String get writePaymentModelFailed =>
      'StorageService failed to persist the payment model.';

  static String get clearStorageFailed =>
      'StorageService failed to clear stored license checker data.';
}
