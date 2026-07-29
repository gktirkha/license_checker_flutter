// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_checker_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LicenseCheckerConfig _$LicenseCheckerConfigFromJson(
  Map<String, dynamic> json,
) => _LicenseCheckerConfig(
  jsonURL: json['jsonURL'] as String,
  appName: json['appName'] as String,
  autoDecrementLaunchCount: json['autoDecrementLaunchCount'] as bool? ?? true,
  showApiLogs: json['showApiLogs'] as bool? ?? true,
  rulesVersion: (json['rulesVersion'] as num?)?.toDouble() ?? 0,
  logTag: json['logTag'] as String? ?? 'LICENSE_CHECKER_FLUTTER_LOG',
);

Map<String, dynamic> _$LicenseCheckerConfigToJson(
  _LicenseCheckerConfig instance,
) => <String, dynamic>{
  'jsonURL': instance.jsonURL,
  'appName': instance.appName,
  'autoDecrementLaunchCount': instance.autoDecrementLaunchCount,
  'showApiLogs': instance.showApiLogs,
  'rulesVersion': instance.rulesVersion,
  'logTag': instance.logTag,
};
