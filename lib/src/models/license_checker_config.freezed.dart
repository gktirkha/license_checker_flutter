// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_checker_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LicenseCheckerConfig {

 String get jsonURL; String get appName; bool get autoDecrementLaunchCount; bool get showApiLogs; double get rulesVersion; String get logTag;
/// Create a copy of LicenseCheckerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenseCheckerConfigCopyWith<LicenseCheckerConfig> get copyWith => _$LicenseCheckerConfigCopyWithImpl<LicenseCheckerConfig>(this as LicenseCheckerConfig, _$identity);

  /// Serializes this LicenseCheckerConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseCheckerConfig&&(identical(other.jsonURL, jsonURL) || other.jsonURL == jsonURL)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.autoDecrementLaunchCount, autoDecrementLaunchCount) || other.autoDecrementLaunchCount == autoDecrementLaunchCount)&&(identical(other.showApiLogs, showApiLogs) || other.showApiLogs == showApiLogs)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.logTag, logTag) || other.logTag == logTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jsonURL,appName,autoDecrementLaunchCount,showApiLogs,rulesVersion,logTag);

@override
String toString() {
  return 'LicenseCheckerConfig(jsonURL: $jsonURL, appName: $appName, autoDecrementLaunchCount: $autoDecrementLaunchCount, showApiLogs: $showApiLogs, rulesVersion: $rulesVersion, logTag: $logTag)';
}


}

/// @nodoc
abstract mixin class $LicenseCheckerConfigCopyWith<$Res>  {
  factory $LicenseCheckerConfigCopyWith(LicenseCheckerConfig value, $Res Function(LicenseCheckerConfig) _then) = _$LicenseCheckerConfigCopyWithImpl;
@useResult
$Res call({
 String jsonURL, String appName, bool autoDecrementLaunchCount, bool showApiLogs, double rulesVersion, String logTag
});




}
/// @nodoc
class _$LicenseCheckerConfigCopyWithImpl<$Res>
    implements $LicenseCheckerConfigCopyWith<$Res> {
  _$LicenseCheckerConfigCopyWithImpl(this._self, this._then);

  final LicenseCheckerConfig _self;
  final $Res Function(LicenseCheckerConfig) _then;

/// Create a copy of LicenseCheckerConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jsonURL = null,Object? appName = null,Object? autoDecrementLaunchCount = null,Object? showApiLogs = null,Object? rulesVersion = null,Object? logTag = null,}) {
  return _then(_self.copyWith(
jsonURL: null == jsonURL ? _self.jsonURL : jsonURL // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,autoDecrementLaunchCount: null == autoDecrementLaunchCount ? _self.autoDecrementLaunchCount : autoDecrementLaunchCount // ignore: cast_nullable_to_non_nullable
as bool,showApiLogs: null == showApiLogs ? _self.showApiLogs : showApiLogs // ignore: cast_nullable_to_non_nullable
as bool,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as double,logTag: null == logTag ? _self.logTag : logTag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LicenseCheckerConfig].
extension LicenseCheckerConfigPatterns on LicenseCheckerConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LicenseCheckerConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LicenseCheckerConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LicenseCheckerConfig value)  $default,){
final _that = this;
switch (_that) {
case _LicenseCheckerConfig():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LicenseCheckerConfig value)?  $default,){
final _that = this;
switch (_that) {
case _LicenseCheckerConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jsonURL,  String appName,  bool autoDecrementLaunchCount,  bool showApiLogs,  double rulesVersion,  String logTag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LicenseCheckerConfig() when $default != null:
return $default(_that.jsonURL,_that.appName,_that.autoDecrementLaunchCount,_that.showApiLogs,_that.rulesVersion,_that.logTag);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jsonURL,  String appName,  bool autoDecrementLaunchCount,  bool showApiLogs,  double rulesVersion,  String logTag)  $default,) {final _that = this;
switch (_that) {
case _LicenseCheckerConfig():
return $default(_that.jsonURL,_that.appName,_that.autoDecrementLaunchCount,_that.showApiLogs,_that.rulesVersion,_that.logTag);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jsonURL,  String appName,  bool autoDecrementLaunchCount,  bool showApiLogs,  double rulesVersion,  String logTag)?  $default,) {final _that = this;
switch (_that) {
case _LicenseCheckerConfig() when $default != null:
return $default(_that.jsonURL,_that.appName,_that.autoDecrementLaunchCount,_that.showApiLogs,_that.rulesVersion,_that.logTag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LicenseCheckerConfig implements LicenseCheckerConfig {
   _LicenseCheckerConfig({required this.jsonURL, required this.appName, this.autoDecrementLaunchCount = true, this.showApiLogs = true, this.rulesVersion = 0, this.logTag = 'LICENSE_CHECKER_FLUTTER_LOG'});
  factory _LicenseCheckerConfig.fromJson(Map<String, dynamic> json) => _$LicenseCheckerConfigFromJson(json);

@override final  String jsonURL;
@override final  String appName;
@override@JsonKey() final  bool autoDecrementLaunchCount;
@override@JsonKey() final  bool showApiLogs;
@override@JsonKey() final  double rulesVersion;
@override@JsonKey() final  String logTag;

/// Create a copy of LicenseCheckerConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LicenseCheckerConfigCopyWith<_LicenseCheckerConfig> get copyWith => __$LicenseCheckerConfigCopyWithImpl<_LicenseCheckerConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LicenseCheckerConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LicenseCheckerConfig&&(identical(other.jsonURL, jsonURL) || other.jsonURL == jsonURL)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.autoDecrementLaunchCount, autoDecrementLaunchCount) || other.autoDecrementLaunchCount == autoDecrementLaunchCount)&&(identical(other.showApiLogs, showApiLogs) || other.showApiLogs == showApiLogs)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.logTag, logTag) || other.logTag == logTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jsonURL,appName,autoDecrementLaunchCount,showApiLogs,rulesVersion,logTag);

@override
String toString() {
  return 'LicenseCheckerConfig(jsonURL: $jsonURL, appName: $appName, autoDecrementLaunchCount: $autoDecrementLaunchCount, showApiLogs: $showApiLogs, rulesVersion: $rulesVersion, logTag: $logTag)';
}


}

/// @nodoc
abstract mixin class _$LicenseCheckerConfigCopyWith<$Res> implements $LicenseCheckerConfigCopyWith<$Res> {
  factory _$LicenseCheckerConfigCopyWith(_LicenseCheckerConfig value, $Res Function(_LicenseCheckerConfig) _then) = __$LicenseCheckerConfigCopyWithImpl;
@override @useResult
$Res call({
 String jsonURL, String appName, bool autoDecrementLaunchCount, bool showApiLogs, double rulesVersion, String logTag
});




}
/// @nodoc
class __$LicenseCheckerConfigCopyWithImpl<$Res>
    implements _$LicenseCheckerConfigCopyWith<$Res> {
  __$LicenseCheckerConfigCopyWithImpl(this._self, this._then);

  final _LicenseCheckerConfig _self;
  final $Res Function(_LicenseCheckerConfig) _then;

/// Create a copy of LicenseCheckerConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jsonURL = null,Object? appName = null,Object? autoDecrementLaunchCount = null,Object? showApiLogs = null,Object? rulesVersion = null,Object? logTag = null,}) {
  return _then(_LicenseCheckerConfig(
jsonURL: null == jsonURL ? _self.jsonURL : jsonURL // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,autoDecrementLaunchCount: null == autoDecrementLaunchCount ? _self.autoDecrementLaunchCount : autoDecrementLaunchCount // ignore: cast_nullable_to_non_nullable
as bool,showApiLogs: null == showApiLogs ? _self.showApiLogs : showApiLogs // ignore: cast_nullable_to_non_nullable
as bool,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as double,logTag: null == logTag ? _self.logTag : logTag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
