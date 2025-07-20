import '../../license_checker_flutter.dart';

/// A service for initializing application configuration settings from environment variables.
///
/// This class provides static methods to retrieve configuration values
/// and ensures that necessary values are provided, throwing exceptions when they are not.
abstract class InitService {
  /// Initializes the URL for the JSON configuration.
  ///
  /// [jsonUrl] - An optional default URL. If no environment variable is found,
  /// the method will throw a [LicenseCheckerFlutterException] if the URL is empty.
  ///
  /// Returns:
  /// - A [String] representing the JSON URL.
  static String initializeUrl(String? jsonUrl) {
    String uri = String.fromEnvironment(
      'LICENSE_CHECKER_JSON_URL',
      defaultValue: jsonUrl ?? '',
    );

    if (uri.isEmpty) {
      throw LicenseCheckerFlutterException(
        message: 'Please Provide LICENSE_CHECKER_JSON_URL in env or init method',
        type: LicenseCheckerExceptionType.VALUE_NOT_FOUND,
      );
    }

    return uri;
  }

  /// Initializes the application name.
  ///
  /// [appName] - An optional default application name. If no environment variable is found,
  /// the method will throw a [LicenseCheckerFlutterException] if the name is empty.
  ///
  /// Returns:
  /// - A [String] representing the application name.
  static String initializeAppName(String? appName) {
    String name = String.fromEnvironment(
      'LICENSE_CHECKER_APP_NAME',
      defaultValue: appName ?? '',
    );

    if (name.isEmpty) {
      throw LicenseCheckerFlutterException(
        message: 'Please Provide LICENSE_CHECKER_APP_NAME in env or init method',
        type: LicenseCheckerExceptionType.VALUE_NOT_FOUND,
      );
    }

    return name;
  }

  /// Initializes the version of the license checker configuration.
  ///
  /// [version] - An optional default version. If no environment variable is found,
  /// the method will throw a [LicenseCheckerFlutterException] if the version is zero or negative.
  ///
  /// Returns:
  /// - A [double] representing the non-zero version.
  static double initializeVersion(double? version) {
    double licenseCheckerVersion = double.tryParse(
          String.fromEnvironment(
            'LICENSE_CHECKER_VERSION',
            defaultValue: version?.toString() ?? '0.0',
          ),
        ) ??
        0.0;

    if (licenseCheckerVersion <= 0) {
      throw LicenseCheckerFlutterException(
        message: 'Please Provide non-zero LICENSE_CHECKER_VERSION in env or init method',
        type: LicenseCheckerExceptionType.VALUE_NOT_FOUND,
      );
    }

    return licenseCheckerVersion;
  }

  /// Initializes the auto decrement setting for launch count.
  ///
  /// [decrement] - An optional default value for auto decrement. If the environment variable is not set,
  /// the method will throw a [LicenseCheckerFlutterException] if no value is provided.
  ///
  /// Returns:
  /// - A [bool] indicating whether auto decrement is enabled.
  static bool initializeAutoDecrement(bool? decrement) {
    const hasEnvBool = bool.hasEnvironment('LICENSE_CHECKER_AUTO_DECREMENT');
    if (hasEnvBool) {
      return const bool.fromEnvironment('LICENSE_CHECKER_AUTO_DECREMENT');
    }

    if (decrement == null) {
      throw LicenseCheckerFlutterException(
        message: 'Please Provide LICENSE_CHECKER_AUTO_DECREMENT in env or init method',
        type: LicenseCheckerExceptionType.VALUE_NOT_FOUND,
      );
    }

    return decrement;
  }
}
