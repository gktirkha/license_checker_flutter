import 'constants/license_checker_error_messages.dart';
import 'exception/license_checker_flutter_exception.dart';
import 'helpers/license_checker_flutter_helper.dart';
import 'logger/license_checker_logger.dart';
import 'models/license_checker_api_response_model/license_checker_api_response_model.dart';
import 'models/license_checker_config/license_checker_config.dart';
import 'services/init_service.dart';
import 'services/storage_service.dart';
import 'typedefs/typedefs.dart';

class LicenseCheckerFlutter {
  static LicenseCheckerConfig? _config;
  static String _logTag = 'LICENSE_CHECKER_FLUTTER_LOG';
  static String get logTag => _logTag;
  static LicenseCheckerApiResponseModel? _mockApiResponse;

  /// Initializes [LicenseCheckerFlutter] with the given [config].
  ///
  /// [mockApiResponse] is intended for testing: when provided, [checkStatus]
  /// uses it in place of the remote JSON and never makes a network call.
  static Future<void> init(
    LicenseCheckerConfig? config, {
    LicenseCheckerApiResponseModel? mockApiResponse,
  }) async {
    try {
      _mockApiResponse = mockApiResponse;
      _config = InitService.init(config);
      if (_config == null) {
        throw LicenseCheckerFlutterException(
          .initFailed,
          message: LicenseCheckerErrorMessages.configResolvedNull,
        );
      }
      _logTag = _config!.logTag;
      await StorageService.init(_config!);
    } catch (e, s) {
      if (e is LicenseCheckerFlutterException) rethrow;
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.initFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> checkStatus({
    Map<String, dynamic>? httpHeaders,
    Map<String, dynamic>? httpQueryParameters,
    Map<String, dynamic>? httpRequestBody,
    String httpMethod = 'GET',
    required OnException onException,
    required OnUnhandled onUnhandled,
    OnAppNotFound? onAppNotFound,
    OnPaid? onPaid,
    OnUnPaid? onUnPaid,
    OnLimitedLaunch? onLimitedLaunch,
    OnLimitedLaunchExceeded? onLimitedLaunchExceeded,
    OnTrial? onTrial,
    OnTrialWarning? onTrialWarning,
    OnTrialEnded? onTrialEnded,
    OnTargetVersionMisMatch? onTargetVersionMisMatch,
    bool useCachedConfigOnNetworkException = true,
  }) async {
    if (_config == null) {
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.configResolvedNull,
      );
    }

    final config = _config!;

    try {
      final bool shouldCheckOnline =
          await LicenseCheckerFlutterHelper.shouldCheckOnline(_config!);

      LicenseCheckerPaymentModel? storedModel = StorageService.paymentModel;

      final LicenseCheckerPaymentModel? operationModel = shouldCheckOnline
          ? await LicenseCheckerFlutterHelper.fetchRemoteModel(
              httpHeaders: httpHeaders ?? {},
              httpQueryParameters: httpQueryParameters ?? {},
              httpRequestBody: httpRequestBody ?? {},
              httpMethod: httpMethod,
              jsonUrl: config.jsonURL,
              appName: config.appName,
              showApiLogs: config.showApiLogs,
              mockApiResponse: _mockApiResponse,
            )
          : storedModel;

      if (operationModel == null) {
        if (onAppNotFound != null) {
          onAppNotFound();
        } else {
          onUnhandled(.APP_NOT_FOUND_IN_JSON, operationModel);
        }
        return;
      }

      if (shouldCheckOnline) {
        storedModel = operationModel;
        await StorageService.setPaymentModel(storedModel);
      }

      final targetVersion = operationModel.targetVersion;

      if (targetVersion == null) {
        throw LicenseCheckerFlutterException(
          .configException,
          message: LicenseCheckerErrorMessages.targetVersionNotSetInRemoteJson,
          operationConfiguration: operationModel,
        );
      }

      if (targetVersion != config.rulesVersion) {
        if (onTargetVersionMisMatch != null) {
          onTargetVersionMisMatch(
            operationModel,
            targetVersion,
            config.rulesVersion,
          );
        } else {
          onUnhandled(.TARGET_VERSION_MISMATCH, operationModel);
        }
        return;
      }
      await LicenseCheckerFlutterHelper.handleExecution(
        onPaid: onPaid,
        onTrial: onTrial,
        onUnPaid: onUnPaid,
        onException: onException,
        onUnhandled: onUnhandled,
        onTrialEnded: onTrialEnded,
        onAppNotFound: onAppNotFound,
        operationModel: operationModel,
        onTrialWarning: onTrialWarning,
        onLimitedLaunch: onLimitedLaunch,
        isOnlineModel: shouldCheckOnline,
        onLimitedLaunchExceeded: onLimitedLaunchExceeded,
        onTargetVersionMisMatch: onTargetVersionMisMatch,
        autoDecrementLaunchCount: config.autoDecrementLaunchCount,
      );
    } catch (e, s) {
      final LicenseCheckerPaymentModel? operationModel =
          StorageService.paymentModel;
      if (useCachedConfigOnNetworkException &&
          operationModel != null &&
          e is LicenseCheckerFlutterException &&
          e.type == .networkException) {
        licenseCheckerLogger(e);
        await LicenseCheckerFlutterHelper.handleExecution(
          onPaid: onPaid,
          onTrial: onTrial,
          onUnPaid: onUnPaid,
          isOnlineModel: false,
          onException: onException,
          onUnhandled: onUnhandled,
          onTrialEnded: onTrialEnded,
          onAppNotFound: onAppNotFound,
          operationModel: operationModel,
          onTrialWarning: onTrialWarning,
          onLimitedLaunch: onLimitedLaunch,
          onLimitedLaunchExceeded: onLimitedLaunchExceeded,
          onTargetVersionMisMatch: onTargetVersionMisMatch,
          autoDecrementLaunchCount: config.autoDecrementLaunchCount,
        );
        return;
      }

      licenseCheckerLogger(e);
      onException(_convertException(e, s));
    }
  }

  static LicenseCheckerFlutterException _convertException(
    dynamic exception,
    StackTrace stackTrace,
  ) {
    if (exception is LicenseCheckerFlutterException) {
      return exception;
    } else {
      return .new(
        .unknown,
        message: exception.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
