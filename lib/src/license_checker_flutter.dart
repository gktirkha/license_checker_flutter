import 'exception/license_checker_exception.dart';
import 'models/license_checker_config.dart';
import 'services/init_service.dart';

class LicenseCheckerFlutter {
  static LicenseCheckerConfig? _config;

  static void init(LicenseCheckerConfig? config) {
    _config = InitService.init(config);
    if (_config == null) {
      throw LicenseCheckerException(.initFailed);
    }
  }
}
