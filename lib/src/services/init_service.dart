import '../constants/license_checker_error_messages.dart';
import '../exception/license_checker_flutter_exception.dart';
import '../models/license_checker_config/license_checker_config.dart';

class InitService {
  InitService._();

  static LicenseCheckerConfig init(LicenseCheckerConfig? config) {
    final resolvedJsonURL = String.fromEnvironment(
      'LICENSE_CHECKER_JSON_URL',
      defaultValue: config?.jsonURL ?? '',
    );
    final resolvedAppName = String.fromEnvironment(
      'LICENSE_CHECKER_APP_NAME',
      defaultValue: config?.appName ?? '',
    );
    final logTag = String.fromEnvironment(
      'LICENSE_CHECKER_LOG_TAG',
      defaultValue: config?.logTag ?? 'LICENSE_CHECKER_FLUTTER_LOG',
    );

    const hasAutoDecrementEnv = bool.hasEnvironment(
      'LICENSE_CHECKER_AUTO_DECREMENT',
    );
    final autoDecrementLaunchCount = hasAutoDecrementEnv
        ? const bool.fromEnvironment('LICENSE_CHECKER_AUTO_DECREMENT')
        : (config?.autoDecrementLaunchCount ?? true);

    const hasShowApiLogsEnv = bool.hasEnvironment(
      'LICENSE_CHECKER_SHOW_API_LOGS',
    );
    final showApiLogs = hasShowApiLogsEnv
        ? const bool.fromEnvironment('LICENSE_CHECKER_SHOW_API_LOGS')
        : (config?.showApiLogs ?? true);

    final rulesVersionSt = String.fromEnvironment(
      'LICENSE_CHECKER_VERSION',
      defaultValue: config?.rulesVersion.toString() ?? '0.0',
    );
    final resolvedRulesVersion = double.tryParse(rulesVersionSt) ?? 0;

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
      logTag: logTag,
      autoDecrementLaunchCount: autoDecrementLaunchCount,
      rulesVersion: resolvedRulesVersion,
      showApiLogs: showApiLogs,
    );
  }
}
