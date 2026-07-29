import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants/license_checker_error_messages.dart';
import '../exception/license_checker_flutter_exception.dart';
import '../logger/license_checker_logger.dart';
import '../models/license_checker_api_response_model/license_checker_api_response_model.dart';
import '../models/license_checker_config/license_checker_config.dart';
import '../services/storage_service.dart';
import '../typedefs/typedefs.dart';

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
        final currentCount = StorageService.allowedLaunchCount;
        return (currentCount == null || currentCount <= 0);

      case .ON_TRIAL:
        if (cachedPaymentModel.checkDuringTrial == true) {
          return true;
        }
        final now = DateTime.now();
        final warningDate = cachedPaymentModel.warningDate;
        final expiryDate = cachedPaymentModel.expireDateTime;
        if (expiryDate == null) {
          return true;
        }
        return (warningDate != null &&
                now.isAfter(warningDate) &&
                now.isBefore(expiryDate)) ||
            now.isAfter(expiryDate);

      case .UNKNOWN:
        return true;
    }
  }

  static Future<LicenseCheckerPaymentModel?> fetchRemoteModel({
    required Map<String, dynamic> httpHeaders,
    required Map<String, dynamic> httpQueryParameters,
    required Map<String, dynamic> httpRequestBody,
    required String httpMethod,
    required String jsonUrl,
    required String appName,
    required bool showApiLogs,
    LicenseCheckerApiResponseModel? mockApiResponse,
  }) async {
    if (mockApiResponse != null) {
      return mockApiResponse.apps?[appName];
    }

    try {
      final Dio dioClient = Dio(
        BaseOptions(
          sendTimeout: const Duration(minutes: 10),
          connectTimeout: const Duration(minutes: 10),
          receiveTimeout: const Duration(minutes: 10),
        ),
      );
      if (showApiLogs) {
        dioClient.interceptors.add(
          LogInterceptor(
            logPrint: (object) => licenseCheckerLogger(object.toString()),
          ),
        );
      }

      final res = (await dioClient.request(
        jsonUrl,
        options: Options(headers: httpHeaders, method: httpMethod),
        queryParameters: httpQueryParameters,
        data: httpRequestBody,
      )).data;

      final LicenseCheckerApiResponseModel apiResponseModel =
          LicenseCheckerApiResponseModel.fromJson(
            res is Map ? res : jsonDecode(res),
          );
      return apiResponseModel.apps?[appName];
    } catch (e) {
      if (e is DioException) {
        final String message = switch (e.type) {
          .connectionTimeout =>
            LicenseCheckerErrorMessages.networkConnectionTimeout,
          .sendTimeout => LicenseCheckerErrorMessages.networkSendTimeout,
          .receiveTimeout => LicenseCheckerErrorMessages.networkReceiveTimeout,
          .badCertificate => LicenseCheckerErrorMessages.networkBadCertificate,
          .badResponse => LicenseCheckerErrorMessages.networkBadResponse,
          .cancel => LicenseCheckerErrorMessages.networkCancel,
          .connectionError =>
            LicenseCheckerErrorMessages.networkConnectionError,
          .unknown => LicenseCheckerErrorMessages.networkUnknown,
          .transformTimeout =>
            LicenseCheckerErrorMessages.networkTransformTimeout,
        };

        throw LicenseCheckerFlutterException(
          message: message,
          .networkException,
          apiResponse: e.response?.toString(),
          stackTrace: e.stackTrace,
          operationConfiguration: StorageService.paymentModel,
        );
      } else {
        rethrow;
      }
    }
  }

  static Future<void> handleExecution({
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
    required LicenseCheckerPaymentModel operationModel,
    required bool isOnlineModel,
    required bool autoDecrementLaunchCount,
  }) async {
    try {
      switch (operationModel.status) {
        case .PAID:
          if (onPaid != null) {
            onPaid(operationModel);
          } else {
            onUnhandled(.PAID, operationModel);
          }
          break;

        case .UNPAID:
          if (onUnPaid != null) {
            onUnPaid(operationModel);
          } else {
            onUnhandled(.UNPAID, operationModel);
          }
          break;

        case .ALLOW_LIMITED_LAUNCHES:
          final allowedLaunches = operationModel.maxLaunch;
          int? currentLaunchCount = StorageService.allowedLaunchCount;

          if (allowedLaunches == null) {
            throw LicenseCheckerFlutterException(
              .configException,
              message:
                  LicenseCheckerErrorMessages.maxLaunchNotSetForLimitedLaunches,
              operationConfiguration: operationModel,
            );
          }

          if (isOnlineModel) {
            if (!operationModel.strictMaxLaunch || currentLaunchCount == null) {
              await StorageService.setAllowedLaunchCount(allowedLaunches);
            }
          }

          currentLaunchCount = StorageService.allowedLaunchCount;

          if (currentLaunchCount == null || currentLaunchCount <= 0) {
            if (onLimitedLaunchExceeded != null) {
              onLimitedLaunchExceeded(operationModel);
            } else {
              onUnhandled(.LIMITED_LAUNCH_EXCEEDED, operationModel);
            }
          } else {
            if (onLimitedLaunch != null) {
              onLimitedLaunch(operationModel, currentLaunchCount);
            } else {
              onUnhandled(.LIMITED_LAUNCH, operationModel);
            }
          }
          if (autoDecrementLaunchCount) await StorageService.decrementCount();

          break;

        case .ON_TRIAL:
          final now = DateTime.now();
          final warningDate = operationModel.warningDate;
          final expiryDate = operationModel.expireDateTime;
          if (expiryDate == null) {
            throw LicenseCheckerFlutterException(
              .configException,
              message: LicenseCheckerErrorMessages.expireDateNotSetForTrial,
            );
          }
          if (warningDate != null &&
              now.isAfter(warningDate) &&
              now.isBefore(expiryDate)) {
            if (onTrialWarning != null) {
              onTrialWarning(operationModel, expiryDate, warningDate);
            } else {
              onUnhandled(.TRIAL_WARNING, operationModel);
            }
          } else if (now.isAfter(expiryDate)) {
            if (onTrialEnded != null) {
              onTrialEnded(operationModel, expiryDate);
            } else {
              onUnhandled(.TRIAL_ENDED, operationModel);
            }
          } else if (now.isBefore(expiryDate)) {
            if (onTrial != null) {
              onTrial(operationModel, expiryDate, warningDate);
            } else {
              onUnhandled(.TRIAL, operationModel);
            }
          }
          break;

        case .UNKNOWN:
          throw LicenseCheckerFlutterException(
            .unknownPaymentStatus,
            message: LicenseCheckerErrorMessages.unknownPaymentStatus,
            operationConfiguration: operationModel,
          );
      }
    } catch (e, s) {
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
