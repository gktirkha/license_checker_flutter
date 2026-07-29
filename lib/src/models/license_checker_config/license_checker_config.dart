import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_checker_config.freezed.dart';
part 'license_checker_config.g.dart';

@freezed
sealed class LicenseCheckerConfig with _$LicenseCheckerConfig {
  factory LicenseCheckerConfig({
    required String jsonURL,
    required String appName,
    @Default(true) bool autoDecrementLaunchCount,
    @Default(true) bool showApiLogs,
    @Default(0) double rulesVersion,
    @Default('LICENSE_CHECKER_FLUTTER_LOG') String logTag,
  }) = _LicenseCheckerConfig;

  factory LicenseCheckerConfig.fromJson(Map<String, dynamic> json) =>
      _$LicenseCheckerConfigFromJson(json);
}
