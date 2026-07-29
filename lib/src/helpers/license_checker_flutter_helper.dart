import 'dart:convert';

import 'package:dio/dio.dart';

import '../exception/license_checker_exception.dart';
import '../logger/license_checker_logger.dart';
import '../models/license_checker_api_response_model/license_checker_api_response_model.dart';
import '../models/license_checker_config/license_checker_config.dart';
import '../services/storage_service.dart';

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
        return (StorageService.allowedLaunchCount <= 0);

      case .ON_TRIAL:
        if (cachedPaymentModel.checkDuringTrial == true) {
          return true;
        }
        final now = DateTime.now();
        final warningDate = cachedPaymentModel.warningDate;
        final expiryDate = cachedPaymentModel.expireDateTime;
        if (expiryDate == null || warningDate == null) {
          return true;
        }
        return (now.isAfter(warningDate) && now.isBefore(expiryDate)) ||
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
  }) async {
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
          .connectionTimeout => 'CONNECTION TIME_OUT',
          .sendTimeout => 'SEND TIME_OUT',
          .receiveTimeout => 'RECEIVE TIME_OUT',
          .badCertificate => 'BAD_CERTIFICATE',
          .badResponse => 'BAD_RESPONSE',
          .cancel => 'CANCEL',
          .connectionError => 'CONNECTION_ERROR',
          .unknown => 'UNKNOWN',
          .transformTimeout => 'TIMEOUT',
        };

        throw LicenseCheckerException(
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
}
