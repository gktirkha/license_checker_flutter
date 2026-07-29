import 'constants/license_checker_error_messages.dart';
import 'exception/license_checker_exception.dart';
import 'models/license_checker_config/license_checker_config.dart';
import 'services/init_service.dart';
import 'services/storage_service.dart';

class LicenseCheckerFlutter {
  static LicenseCheckerConfig? _config;
  static String _logTag = 'LICENSE_CHECKER_FLUTTER_LOG';
  static String get logTag => _logTag;

  static void init(LicenseCheckerConfig? config) async {
    try {
      _config = InitService.init(config);
      if (_config == null) {
        throw LicenseCheckerException(
          .initFailed,
          message: LicenseCheckerErrorMessages.configResolvedNull,
        );
      }
      _logTag = _config!.logTag;
      await StorageService.init(_config!);
    } catch (e, s) {
      if (e is LicenseCheckerException) rethrow;
      throw LicenseCheckerException(
        .initFailed,
        message: LicenseCheckerErrorMessages.initFailed,
        stackTrace: s,
      );
    }
  }
}
