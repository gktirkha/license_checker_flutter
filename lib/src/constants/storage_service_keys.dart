part of '../services/storage_service.dart';

abstract class _StorageServiceKeys {
  static String get _ref => 'LICENSE_CHECKER_FLUTTER_REF_';

  static String get version => '${_ref}VERSION';

  static String get paymentModel => '${_ref}PAYMENT_MODEL';

  static String get launchCount => '${_ref}LAUNCH_COUNT';

  static String get appName => '${_ref}APP_NAME';
}
