import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/license_checker_error_messages.dart';
import '../exception/license_checker_flutter_exception.dart';
import '../logger/license_checker_logger.dart';
import '../models/license_checker_api_response_model/license_checker_api_response_model.dart';
import '../models/license_checker_config/license_checker_config.dart';

class StorageService {
  StorageService._();
  static SharedPreferences? _preferences;

  static Future<void> init(LicenseCheckerConfig config) async {
    try {
      _preferences = await SharedPreferences.getInstance();
      await _setConfig(config.rulesVersion, config.appName);
    } catch (e, s) {
      if (e is LicenseCheckerFlutterException) {
        rethrow;
      }
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.storageInitFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> _setConfig(double version, String appName) async {
    final storedVersion = _version;
    final storedAppName = _appName;

    if ((version == storedVersion) && (appName == storedAppName)) {
      return;
    }

    if (storedAppName != appName) {
      await _clear();
    }

    if (storedAppName == null) {
      await _clear();
      await _setVersion(version);
      await _setAppName(appName);
      return;
    }

    if (version > storedVersion) {
      await _clear();
      await _setVersion(version);
    }
  }

  static double get _version {
    try {
      return _preferences!.getDouble(_StorageServiceKeys.version) ?? 0;
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.readVersionFailed,
        stackTrace: s,
      );
    }
  }

  static String? get _appName {
    try {
      return _preferences!.getString(_StorageServiceKeys.appName);
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.readAppNameFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> _setVersion(double version) async {
    try {
      await _preferences!.setDouble(_StorageServiceKeys.version, version);
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.writeVersionFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> _setAppName(String appName) async {
    try {
      await _preferences!.setString(_StorageServiceKeys.appName, appName);
    } catch (e, s) {
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.writeAppNameFailed,
        stackTrace: s,
      );
    }
  }

  static int? get allowedLaunchCount {
    try {
      return _preferences!.getInt(_StorageServiceKeys.allowedLaunchCount);
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.readAllowedLaunchCountFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> setAllowedLaunchCount(int count) async {
    try {
      final launchToBeSet = count < 0 ? count * -1 * 100 : count;
      await _preferences!.setInt(
        _StorageServiceKeys.allowedLaunchCount,
        launchToBeSet,
      );
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.writeAllowedLaunchCountFailed,
        stackTrace: s,
      );
    }
  }

  /// Decrements the launch count in SharedPreferences by one.
  ///
  /// This method will not decrement if the current count is null or less than or equal to zero.
  static Future<void> decrementCount() async {
    try {
      final currentCount = allowedLaunchCount;
      if (currentCount == null || currentCount <= 0) {
        return;
      }
      await _preferences!.setInt(
        _StorageServiceKeys.allowedLaunchCount,
        currentCount - 1,
      );
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.clearAllowedLaunchCountFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> clearAllowedLaunchCount() async {
    try {
      await _preferences!.setInt(_StorageServiceKeys.allowedLaunchCount, 0);
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.clearAllowedLaunchCountFailed,
        stackTrace: s,
      );
    }
  }

  static LicenseCheckerPaymentModel? get paymentModel {
    try {
      final raw = _preferences!.getString(_StorageServiceKeys.paymentModel);
      if (raw == null) {
        return null;
      }
      return LicenseCheckerPaymentModel.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.readPaymentModelFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> setPaymentModel(LicenseCheckerPaymentModel model) async {
    try {
      await _preferences!.setString(
        _StorageServiceKeys.paymentModel,
        jsonEncode(model.toJson()),
      );
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.writePaymentModelFailed,
        stackTrace: s,
      );
    }
  }

  static Future<void> _clear() async {
    try {
      final keys = _preferences!.getKeys().where(
        (key) => key.startsWith(_StorageServiceKeys._ref),
      );
      for (final key in keys) {
        await _preferences!.remove(key);
      }
    } catch (e, s) {
      licenseCheckerLogger(e);
      throw LicenseCheckerFlutterException(
        .initFailed,
        message: LicenseCheckerErrorMessages.clearStorageFailed,
        stackTrace: s,
      );
    }
  }
}

sealed class _StorageServiceKeys {
  static String get _ref => 'LICENSE_CHECKER_FLUTTER_REF_';

  static String get version => '${_ref}VERSION';

  static String get paymentModel => '${_ref}PAYMENT_MODEL';

  static String get allowedLaunchCount => '${_ref}ALLOWED_LAUNCH_COUNT';

  static String get appName => '${_ref}APP_NAME';
}
