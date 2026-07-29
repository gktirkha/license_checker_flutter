import '../constants/license_checker_error_messages.dart';
import '../exception/license_checker_flutter_exception.dart';
import '../models/license_checker_config/license_checker_config.dart';

class InitService {
  InitService._();

  static LicenseCheckerConfig init(LicenseCheckerConfig? config) {
    const jsonURL = String.fromEnvironment('LICENSE_CHECKER_JSON_URL');
    const appName = String.fromEnvironment('LICENSE_CHECKER_APP_NAME');
    const logTag = String.fromEnvironment(
      'LICENSE_CHECKER_LOG_TAG',
      defaultValue: 'LICENSE_CHECKER_FLUTTER_LOG',
    );
    const autoDecrementLaunchCount = bool.fromEnvironment(
      'LICENSE_CHECKER_AUTO_DECREMENT',
      defaultValue: true,
    );
    const showApiLogs = bool.fromEnvironment(
      'LICENSE_CHECKER_SHOW_API_LOGS',
      defaultValue: true,
    );
    const rulesVersionSt = String.fromEnvironment('LICENSE_CHECKER_VERSION');
    final rulesVersion = double.tryParse(rulesVersionSt) ?? 0;

    final resolvedJsonURL = config?.jsonURL ?? jsonURL;
    final resolvedAppName = config?.appName ?? appName;
    final resolvedRulesVersion = config?.rulesVersion ?? rulesVersion;

    if (resolvedJsonURL.isEmpty) {
      throw LicenseCheckerFlutterException(
        .valueNotFound,
        message: LicenseCheckerErrorMessages.missingJsonUrl,
      );
    }

    if (resolvedAppName.isEmpty) {
      throw LicenseCheckerFlutterException(
        .valueNotFound,
        message: LicenseCheckerErrorMessages.missingAppName,
      );
    }

    if (resolvedRulesVersion <= 0) {
      throw LicenseCheckerFlutterException(
        .valueNotFound,
        message: LicenseCheckerErrorMessages.missingOrInvalidRulesVersion,
      );
    }

    return LicenseCheckerConfig(
      jsonURL: resolvedJsonURL,
      appName: resolvedAppName,
      logTag: config?.logTag ?? logTag,
      autoDecrementLaunchCount:
          config?.autoDecrementLaunchCount ?? autoDecrementLaunchCount,
      rulesVersion: resolvedRulesVersion,
      showApiLogs: config?.showApiLogs ?? showApiLogs,
    );
  }
}
