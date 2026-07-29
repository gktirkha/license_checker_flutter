// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_checker_api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LicenseCheckerApiResponseModel {

@JsonKey(name: 'apps') List<LicenseCheckerPaymentModel> get apps;
/// Create a copy of LicenseCheckerApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenseCheckerApiResponseModelCopyWith<LicenseCheckerApiResponseModel> get copyWith => _$LicenseCheckerApiResponseModelCopyWithImpl<LicenseCheckerApiResponseModel>(this as LicenseCheckerApiResponseModel, _$identity);

  /// Serializes this LicenseCheckerApiResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseCheckerApiResponseModel&&const DeepCollectionEquality().equals(other.apps, apps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(apps));

@override
String toString() {
  return 'LicenseCheckerApiResponseModel(apps: $apps)';
}


}

/// @nodoc
abstract mixin class $LicenseCheckerApiResponseModelCopyWith<$Res>  {
  factory $LicenseCheckerApiResponseModelCopyWith(LicenseCheckerApiResponseModel value, $Res Function(LicenseCheckerApiResponseModel) _then) = _$LicenseCheckerApiResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'apps') List<LicenseCheckerPaymentModel> apps
});




}
/// @nodoc
class _$LicenseCheckerApiResponseModelCopyWithImpl<$Res>
    implements $LicenseCheckerApiResponseModelCopyWith<$Res> {
  _$LicenseCheckerApiResponseModelCopyWithImpl(this._self, this._then);

  final LicenseCheckerApiResponseModel _self;
  final $Res Function(LicenseCheckerApiResponseModel) _then;

/// Create a copy of LicenseCheckerApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apps = null,}) {
  return _then(_self.copyWith(
apps: null == apps ? _self.apps : apps // ignore: cast_nullable_to_non_nullable
as List<LicenseCheckerPaymentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [LicenseCheckerApiResponseModel].
extension LicenseCheckerApiResponseModelPatterns on LicenseCheckerApiResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LicenseCheckerApiResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LicenseCheckerApiResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LicenseCheckerApiResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LicenseCheckerApiResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LicenseCheckerApiResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LicenseCheckerApiResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'apps')  List<LicenseCheckerPaymentModel> apps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LicenseCheckerApiResponseModel() when $default != null:
return $default(_that.apps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'apps')  List<LicenseCheckerPaymentModel> apps)  $default,) {final _that = this;
switch (_that) {
case _LicenseCheckerApiResponseModel():
return $default(_that.apps);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'apps')  List<LicenseCheckerPaymentModel> apps)?  $default,) {final _that = this;
switch (_that) {
case _LicenseCheckerApiResponseModel() when $default != null:
return $default(_that.apps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LicenseCheckerApiResponseModel implements LicenseCheckerApiResponseModel {
   _LicenseCheckerApiResponseModel({@JsonKey(name: 'apps') final  List<LicenseCheckerPaymentModel> apps = const []}): _apps = apps;
  factory _LicenseCheckerApiResponseModel.fromJson(Map<String, dynamic> json) => _$LicenseCheckerApiResponseModelFromJson(json);

 final  List<LicenseCheckerPaymentModel> _apps;
@override@JsonKey(name: 'apps') List<LicenseCheckerPaymentModel> get apps {
  if (_apps is EqualUnmodifiableListView) return _apps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_apps);
}


/// Create a copy of LicenseCheckerApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LicenseCheckerApiResponseModelCopyWith<_LicenseCheckerApiResponseModel> get copyWith => __$LicenseCheckerApiResponseModelCopyWithImpl<_LicenseCheckerApiResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LicenseCheckerApiResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LicenseCheckerApiResponseModel&&const DeepCollectionEquality().equals(other._apps, _apps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_apps));

@override
String toString() {
  return 'LicenseCheckerApiResponseModel(apps: $apps)';
}


}

/// @nodoc
abstract mixin class _$LicenseCheckerApiResponseModelCopyWith<$Res> implements $LicenseCheckerApiResponseModelCopyWith<$Res> {
  factory _$LicenseCheckerApiResponseModelCopyWith(_LicenseCheckerApiResponseModel value, $Res Function(_LicenseCheckerApiResponseModel) _then) = __$LicenseCheckerApiResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'apps') List<LicenseCheckerPaymentModel> apps
});




}
/// @nodoc
class __$LicenseCheckerApiResponseModelCopyWithImpl<$Res>
    implements _$LicenseCheckerApiResponseModelCopyWith<$Res> {
  __$LicenseCheckerApiResponseModelCopyWithImpl(this._self, this._then);

  final _LicenseCheckerApiResponseModel _self;
  final $Res Function(_LicenseCheckerApiResponseModel) _then;

/// Create a copy of LicenseCheckerApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apps = null,}) {
  return _then(_LicenseCheckerApiResponseModel(
apps: null == apps ? _self._apps : apps // ignore: cast_nullable_to_non_nullable
as List<LicenseCheckerPaymentModel>,
  ));
}


}

LicenseCheckerPaymentModel _$LicenseCheckerPaymentModelFromJson(
  Map<String, dynamic> json
) {
    return _AppPaymentModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$LicenseCheckerPaymentModel {

@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN) PaymentStatus get status;@JsonKey(name: 'target_version') double get targetVersion;@JsonKey(name: 'should_check_after_paid') bool get shouldCheckAfterPaid;@JsonKey(name: 'check_during_trial') bool get checkDuringTrial;@JsonKey(name: 'expire_date') DateTime? get expireDateTime;@JsonKey(name: 'warning_date') DateTime? get warningDate;@JsonKey(name: 'strict_max_launch') bool get strictMaxLaunch;@JsonKey(name: 'max_launch') int? get maxLaunch;@JsonKey(name: 'developer_details') Map<String, dynamic> get developerDetails;@JsonKey(name: 'additional_fields') Map<String, dynamic> get additionalFields;
/// Create a copy of LicenseCheckerPaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenseCheckerPaymentModelCopyWith<LicenseCheckerPaymentModel> get copyWith => _$LicenseCheckerPaymentModelCopyWithImpl<LicenseCheckerPaymentModel>(this as LicenseCheckerPaymentModel, _$identity);

  /// Serializes this LicenseCheckerPaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseCheckerPaymentModel&&(identical(other.status, status) || other.status == status)&&(identical(other.targetVersion, targetVersion) || other.targetVersion == targetVersion)&&(identical(other.shouldCheckAfterPaid, shouldCheckAfterPaid) || other.shouldCheckAfterPaid == shouldCheckAfterPaid)&&(identical(other.checkDuringTrial, checkDuringTrial) || other.checkDuringTrial == checkDuringTrial)&&(identical(other.expireDateTime, expireDateTime) || other.expireDateTime == expireDateTime)&&(identical(other.warningDate, warningDate) || other.warningDate == warningDate)&&(identical(other.strictMaxLaunch, strictMaxLaunch) || other.strictMaxLaunch == strictMaxLaunch)&&(identical(other.maxLaunch, maxLaunch) || other.maxLaunch == maxLaunch)&&const DeepCollectionEquality().equals(other.developerDetails, developerDetails)&&const DeepCollectionEquality().equals(other.additionalFields, additionalFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,targetVersion,shouldCheckAfterPaid,checkDuringTrial,expireDateTime,warningDate,strictMaxLaunch,maxLaunch,const DeepCollectionEquality().hash(developerDetails),const DeepCollectionEquality().hash(additionalFields));

@override
String toString() {
  return 'LicenseCheckerPaymentModel(status: $status, targetVersion: $targetVersion, shouldCheckAfterPaid: $shouldCheckAfterPaid, checkDuringTrial: $checkDuringTrial, expireDateTime: $expireDateTime, warningDate: $warningDate, strictMaxLaunch: $strictMaxLaunch, maxLaunch: $maxLaunch, developerDetails: $developerDetails, additionalFields: $additionalFields)';
}


}

/// @nodoc
abstract mixin class $LicenseCheckerPaymentModelCopyWith<$Res>  {
  factory $LicenseCheckerPaymentModelCopyWith(LicenseCheckerPaymentModel value, $Res Function(LicenseCheckerPaymentModel) _then) = _$LicenseCheckerPaymentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN) PaymentStatus status,@JsonKey(name: 'target_version') double targetVersion,@JsonKey(name: 'should_check_after_paid') bool shouldCheckAfterPaid,@JsonKey(name: 'check_during_trial') bool checkDuringTrial,@JsonKey(name: 'expire_date') DateTime? expireDateTime,@JsonKey(name: 'warning_date') DateTime? warningDate,@JsonKey(name: 'strict_max_launch') bool strictMaxLaunch,@JsonKey(name: 'max_launch') int? maxLaunch,@JsonKey(name: 'developer_details') Map<String, dynamic> developerDetails,@JsonKey(name: 'additional_fields') Map<String, dynamic> additionalFields
});




}
/// @nodoc
class _$LicenseCheckerPaymentModelCopyWithImpl<$Res>
    implements $LicenseCheckerPaymentModelCopyWith<$Res> {
  _$LicenseCheckerPaymentModelCopyWithImpl(this._self, this._then);

  final LicenseCheckerPaymentModel _self;
  final $Res Function(LicenseCheckerPaymentModel) _then;

/// Create a copy of LicenseCheckerPaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? targetVersion = null,Object? shouldCheckAfterPaid = null,Object? checkDuringTrial = null,Object? expireDateTime = freezed,Object? warningDate = freezed,Object? strictMaxLaunch = null,Object? maxLaunch = freezed,Object? developerDetails = null,Object? additionalFields = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,targetVersion: null == targetVersion ? _self.targetVersion : targetVersion // ignore: cast_nullable_to_non_nullable
as double,shouldCheckAfterPaid: null == shouldCheckAfterPaid ? _self.shouldCheckAfterPaid : shouldCheckAfterPaid // ignore: cast_nullable_to_non_nullable
as bool,checkDuringTrial: null == checkDuringTrial ? _self.checkDuringTrial : checkDuringTrial // ignore: cast_nullable_to_non_nullable
as bool,expireDateTime: freezed == expireDateTime ? _self.expireDateTime : expireDateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,warningDate: freezed == warningDate ? _self.warningDate : warningDate // ignore: cast_nullable_to_non_nullable
as DateTime?,strictMaxLaunch: null == strictMaxLaunch ? _self.strictMaxLaunch : strictMaxLaunch // ignore: cast_nullable_to_non_nullable
as bool,maxLaunch: freezed == maxLaunch ? _self.maxLaunch : maxLaunch // ignore: cast_nullable_to_non_nullable
as int?,developerDetails: null == developerDetails ? _self.developerDetails : developerDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,additionalFields: null == additionalFields ? _self.additionalFields : additionalFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [LicenseCheckerPaymentModel].
extension LicenseCheckerPaymentModelPatterns on LicenseCheckerPaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppPaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppPaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppPaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _AppPaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppPaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppPaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN)  PaymentStatus status, @JsonKey(name: 'target_version')  double targetVersion, @JsonKey(name: 'should_check_after_paid')  bool shouldCheckAfterPaid, @JsonKey(name: 'check_during_trial')  bool checkDuringTrial, @JsonKey(name: 'expire_date')  DateTime? expireDateTime, @JsonKey(name: 'warning_date')  DateTime? warningDate, @JsonKey(name: 'strict_max_launch')  bool strictMaxLaunch, @JsonKey(name: 'max_launch')  int? maxLaunch, @JsonKey(name: 'developer_details')  Map<String, dynamic> developerDetails, @JsonKey(name: 'additional_fields')  Map<String, dynamic> additionalFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppPaymentModel() when $default != null:
return $default(_that.status,_that.targetVersion,_that.shouldCheckAfterPaid,_that.checkDuringTrial,_that.expireDateTime,_that.warningDate,_that.strictMaxLaunch,_that.maxLaunch,_that.developerDetails,_that.additionalFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN)  PaymentStatus status, @JsonKey(name: 'target_version')  double targetVersion, @JsonKey(name: 'should_check_after_paid')  bool shouldCheckAfterPaid, @JsonKey(name: 'check_during_trial')  bool checkDuringTrial, @JsonKey(name: 'expire_date')  DateTime? expireDateTime, @JsonKey(name: 'warning_date')  DateTime? warningDate, @JsonKey(name: 'strict_max_launch')  bool strictMaxLaunch, @JsonKey(name: 'max_launch')  int? maxLaunch, @JsonKey(name: 'developer_details')  Map<String, dynamic> developerDetails, @JsonKey(name: 'additional_fields')  Map<String, dynamic> additionalFields)  $default,) {final _that = this;
switch (_that) {
case _AppPaymentModel():
return $default(_that.status,_that.targetVersion,_that.shouldCheckAfterPaid,_that.checkDuringTrial,_that.expireDateTime,_that.warningDate,_that.strictMaxLaunch,_that.maxLaunch,_that.developerDetails,_that.additionalFields);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN)  PaymentStatus status, @JsonKey(name: 'target_version')  double targetVersion, @JsonKey(name: 'should_check_after_paid')  bool shouldCheckAfterPaid, @JsonKey(name: 'check_during_trial')  bool checkDuringTrial, @JsonKey(name: 'expire_date')  DateTime? expireDateTime, @JsonKey(name: 'warning_date')  DateTime? warningDate, @JsonKey(name: 'strict_max_launch')  bool strictMaxLaunch, @JsonKey(name: 'max_launch')  int? maxLaunch, @JsonKey(name: 'developer_details')  Map<String, dynamic> developerDetails, @JsonKey(name: 'additional_fields')  Map<String, dynamic> additionalFields)?  $default,) {final _that = this;
switch (_that) {
case _AppPaymentModel() when $default != null:
return $default(_that.status,_that.targetVersion,_that.shouldCheckAfterPaid,_that.checkDuringTrial,_that.expireDateTime,_that.warningDate,_that.strictMaxLaunch,_that.maxLaunch,_that.developerDetails,_that.additionalFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppPaymentModel implements LicenseCheckerPaymentModel {
  const _AppPaymentModel({@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN) this.status = PaymentStatus.UNKNOWN, @JsonKey(name: 'target_version') this.targetVersion = 0, @JsonKey(name: 'should_check_after_paid') this.shouldCheckAfterPaid = false, @JsonKey(name: 'check_during_trial') this.checkDuringTrial = false, @JsonKey(name: 'expire_date') this.expireDateTime, @JsonKey(name: 'warning_date') this.warningDate, @JsonKey(name: 'strict_max_launch') this.strictMaxLaunch = true, @JsonKey(name: 'max_launch') this.maxLaunch, @JsonKey(name: 'developer_details') final  Map<String, dynamic> developerDetails = const {}, @JsonKey(name: 'additional_fields') final  Map<String, dynamic> additionalFields = const {}}): _developerDetails = developerDetails,_additionalFields = additionalFields;
  factory _AppPaymentModel.fromJson(Map<String, dynamic> json) => _$AppPaymentModelFromJson(json);

@override@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN) final  PaymentStatus status;
@override@JsonKey(name: 'target_version') final  double targetVersion;
@override@JsonKey(name: 'should_check_after_paid') final  bool shouldCheckAfterPaid;
@override@JsonKey(name: 'check_during_trial') final  bool checkDuringTrial;
@override@JsonKey(name: 'expire_date') final  DateTime? expireDateTime;
@override@JsonKey(name: 'warning_date') final  DateTime? warningDate;
@override@JsonKey(name: 'strict_max_launch') final  bool strictMaxLaunch;
@override@JsonKey(name: 'max_launch') final  int? maxLaunch;
 final  Map<String, dynamic> _developerDetails;
@override@JsonKey(name: 'developer_details') Map<String, dynamic> get developerDetails {
  if (_developerDetails is EqualUnmodifiableMapView) return _developerDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerDetails);
}

 final  Map<String, dynamic> _additionalFields;
@override@JsonKey(name: 'additional_fields') Map<String, dynamic> get additionalFields {
  if (_additionalFields is EqualUnmodifiableMapView) return _additionalFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_additionalFields);
}


/// Create a copy of LicenseCheckerPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppPaymentModelCopyWith<_AppPaymentModel> get copyWith => __$AppPaymentModelCopyWithImpl<_AppPaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppPaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppPaymentModel&&(identical(other.status, status) || other.status == status)&&(identical(other.targetVersion, targetVersion) || other.targetVersion == targetVersion)&&(identical(other.shouldCheckAfterPaid, shouldCheckAfterPaid) || other.shouldCheckAfterPaid == shouldCheckAfterPaid)&&(identical(other.checkDuringTrial, checkDuringTrial) || other.checkDuringTrial == checkDuringTrial)&&(identical(other.expireDateTime, expireDateTime) || other.expireDateTime == expireDateTime)&&(identical(other.warningDate, warningDate) || other.warningDate == warningDate)&&(identical(other.strictMaxLaunch, strictMaxLaunch) || other.strictMaxLaunch == strictMaxLaunch)&&(identical(other.maxLaunch, maxLaunch) || other.maxLaunch == maxLaunch)&&const DeepCollectionEquality().equals(other._developerDetails, _developerDetails)&&const DeepCollectionEquality().equals(other._additionalFields, _additionalFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,targetVersion,shouldCheckAfterPaid,checkDuringTrial,expireDateTime,warningDate,strictMaxLaunch,maxLaunch,const DeepCollectionEquality().hash(_developerDetails),const DeepCollectionEquality().hash(_additionalFields));

@override
String toString() {
  return 'LicenseCheckerPaymentModel(status: $status, targetVersion: $targetVersion, shouldCheckAfterPaid: $shouldCheckAfterPaid, checkDuringTrial: $checkDuringTrial, expireDateTime: $expireDateTime, warningDate: $warningDate, strictMaxLaunch: $strictMaxLaunch, maxLaunch: $maxLaunch, developerDetails: $developerDetails, additionalFields: $additionalFields)';
}


}

/// @nodoc
abstract mixin class _$AppPaymentModelCopyWith<$Res> implements $LicenseCheckerPaymentModelCopyWith<$Res> {
  factory _$AppPaymentModelCopyWith(_AppPaymentModel value, $Res Function(_AppPaymentModel) _then) = __$AppPaymentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN) PaymentStatus status,@JsonKey(name: 'target_version') double targetVersion,@JsonKey(name: 'should_check_after_paid') bool shouldCheckAfterPaid,@JsonKey(name: 'check_during_trial') bool checkDuringTrial,@JsonKey(name: 'expire_date') DateTime? expireDateTime,@JsonKey(name: 'warning_date') DateTime? warningDate,@JsonKey(name: 'strict_max_launch') bool strictMaxLaunch,@JsonKey(name: 'max_launch') int? maxLaunch,@JsonKey(name: 'developer_details') Map<String, dynamic> developerDetails,@JsonKey(name: 'additional_fields') Map<String, dynamic> additionalFields
});




}
/// @nodoc
class __$AppPaymentModelCopyWithImpl<$Res>
    implements _$AppPaymentModelCopyWith<$Res> {
  __$AppPaymentModelCopyWithImpl(this._self, this._then);

  final _AppPaymentModel _self;
  final $Res Function(_AppPaymentModel) _then;

/// Create a copy of LicenseCheckerPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? targetVersion = null,Object? shouldCheckAfterPaid = null,Object? checkDuringTrial = null,Object? expireDateTime = freezed,Object? warningDate = freezed,Object? strictMaxLaunch = null,Object? maxLaunch = freezed,Object? developerDetails = null,Object? additionalFields = null,}) {
  return _then(_AppPaymentModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,targetVersion: null == targetVersion ? _self.targetVersion : targetVersion // ignore: cast_nullable_to_non_nullable
as double,shouldCheckAfterPaid: null == shouldCheckAfterPaid ? _self.shouldCheckAfterPaid : shouldCheckAfterPaid // ignore: cast_nullable_to_non_nullable
as bool,checkDuringTrial: null == checkDuringTrial ? _self.checkDuringTrial : checkDuringTrial // ignore: cast_nullable_to_non_nullable
as bool,expireDateTime: freezed == expireDateTime ? _self.expireDateTime : expireDateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,warningDate: freezed == warningDate ? _self.warningDate : warningDate // ignore: cast_nullable_to_non_nullable
as DateTime?,strictMaxLaunch: null == strictMaxLaunch ? _self.strictMaxLaunch : strictMaxLaunch // ignore: cast_nullable_to_non_nullable
as bool,maxLaunch: freezed == maxLaunch ? _self.maxLaunch : maxLaunch // ignore: cast_nullable_to_non_nullable
as int?,developerDetails: null == developerDetails ? _self._developerDetails : developerDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,additionalFields: null == additionalFields ? _self._additionalFields : additionalFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
