import '../models/license_checker_config.dart';

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
      'LICENSE_CHECKER_AUTO_DECREMENT_LAUNCH_COUNT',
      defaultValue: true,
    );
    const showApiLogs = bool.fromEnvironment(
      'LICENSE_CHECKER_SHOW_API_LOGS',
      defaultValue: true,
    );
    const rulesVersionSt = String.fromEnvironment(
      'LICENSE_CHECKER_RULES_VERSION',
    );
    final rulesVersion = num.tryParse(rulesVersionSt) ?? 0;

    return LicenseCheckerConfig(
      jsonURL: config?.jsonURL ?? jsonURL,
      appName: config?.appName ?? appName,
      logTag: config?.logTag ?? logTag,
      autoDecrementLaunchCount:
          config?.autoDecrementLaunchCount ?? autoDecrementLaunchCount,
      rulesVersion: config?.rulesVersion ?? rulesVersion,
      showApiLogs: config?.showApiLogs ?? showApiLogs,
    );
  }
}
