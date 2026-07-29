import 'exception/license_checker_exception.dart';
import 'models/license_checker_config.dart';
import 'services/init_service.dart';
import 'services/storage_service.dart';

class LicenseCheckerFlutter {
  static LicenseCheckerConfig? _config;
  static String logTag = 'LICENSE_CHECKER_FLUTTER_LOG';

  static void init(LicenseCheckerConfig? config) async {
    _config = InitService.init(config);
    if (_config == null) {
      throw LicenseCheckerException(.initFailed);
    }
    logTag = _config!.logTag;
    await StorageService.init(_config!);
  }
}
