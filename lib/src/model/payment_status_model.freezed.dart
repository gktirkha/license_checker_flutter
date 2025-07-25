// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LicenseCheckerApiResponseModel _$LicenseCheckerApiResponseModelFromJson(
    Map<String, dynamic> json) {
  return _LicenseCheckerApiResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LicenseCheckerApiResponseModel {
  @JsonKey(name: 'apps')
  Map<String, LicenseCheckerPaymentModel>? get apps =>
      throw _privateConstructorUsedError;

  /// Serializes this LicenseCheckerApiResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LicenseCheckerApiResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LicenseCheckerApiResponseModelCopyWith<LicenseCheckerApiResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseCheckerApiResponseModelCopyWith<$Res> {
  factory $LicenseCheckerApiResponseModelCopyWith(
          LicenseCheckerApiResponseModel value,
          $Res Function(LicenseCheckerApiResponseModel) then) =
      _$LicenseCheckerApiResponseModelCopyWithImpl<$Res,
          LicenseCheckerApiResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'apps') Map<String, LicenseCheckerPaymentModel>? apps});
}

/// @nodoc
class _$LicenseCheckerApiResponseModelCopyWithImpl<$Res,
        $Val extends LicenseCheckerApiResponseModel>
    implements $LicenseCheckerApiResponseModelCopyWith<$Res> {
  _$LicenseCheckerApiResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LicenseCheckerApiResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apps = freezed,
  }) {
    return _then(_value.copyWith(
      apps: freezed == apps
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as Map<String, LicenseCheckerPaymentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicenseCheckerApiResponseModelImplCopyWith<$Res>
    implements $LicenseCheckerApiResponseModelCopyWith<$Res> {
  factory _$$LicenseCheckerApiResponseModelImplCopyWith(
          _$LicenseCheckerApiResponseModelImpl value,
          $Res Function(_$LicenseCheckerApiResponseModelImpl) then) =
      __$$LicenseCheckerApiResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'apps') Map<String, LicenseCheckerPaymentModel>? apps});
}

/// @nodoc
class __$$LicenseCheckerApiResponseModelImplCopyWithImpl<$Res>
    extends _$LicenseCheckerApiResponseModelCopyWithImpl<$Res,
        _$LicenseCheckerApiResponseModelImpl>
    implements _$$LicenseCheckerApiResponseModelImplCopyWith<$Res> {
  __$$LicenseCheckerApiResponseModelImplCopyWithImpl(
      _$LicenseCheckerApiResponseModelImpl _value,
      $Res Function(_$LicenseCheckerApiResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LicenseCheckerApiResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apps = freezed,
  }) {
    return _then(_$LicenseCheckerApiResponseModelImpl(
      apps: freezed == apps
          ? _value._apps
          : apps // ignore: cast_nullable_to_non_nullable
              as Map<String, LicenseCheckerPaymentModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LicenseCheckerApiResponseModelImpl
    implements _LicenseCheckerApiResponseModel {
  const _$LicenseCheckerApiResponseModelImpl(
      {@JsonKey(name: 'apps')
      final Map<String, LicenseCheckerPaymentModel>? apps})
      : _apps = apps;

  factory _$LicenseCheckerApiResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LicenseCheckerApiResponseModelImplFromJson(json);

  final Map<String, LicenseCheckerPaymentModel>? _apps;
  @override
  @JsonKey(name: 'apps')
  Map<String, LicenseCheckerPaymentModel>? get apps {
    final value = _apps;
    if (value == null) return null;
    if (_apps is EqualUnmodifiableMapView) return _apps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'LicenseCheckerApiResponseModel(apps: $apps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicenseCheckerApiResponseModelImpl &&
            const DeepCollectionEquality().equals(other._apps, _apps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_apps));

  /// Create a copy of LicenseCheckerApiResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LicenseCheckerApiResponseModelImplCopyWith<
          _$LicenseCheckerApiResponseModelImpl>
      get copyWith => __$$LicenseCheckerApiResponseModelImplCopyWithImpl<
          _$LicenseCheckerApiResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicenseCheckerApiResponseModelImplToJson(
      this,
    );
  }
}

abstract class _LicenseCheckerApiResponseModel
    implements LicenseCheckerApiResponseModel {
  const factory _LicenseCheckerApiResponseModel(
          {@JsonKey(name: 'apps')
          final Map<String, LicenseCheckerPaymentModel>? apps}) =
      _$LicenseCheckerApiResponseModelImpl;

  factory _LicenseCheckerApiResponseModel.fromJson(Map<String, dynamic> json) =
      _$LicenseCheckerApiResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'apps')
  Map<String, LicenseCheckerPaymentModel>? get apps;

  /// Create a copy of LicenseCheckerApiResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LicenseCheckerApiResponseModelImplCopyWith<
          _$LicenseCheckerApiResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LicenseCheckerPaymentModel _$LicenseCheckerPaymentModelFromJson(
    Map<String, dynamic> json) {
  return _AppPaymentModel.fromJson(json);
}

/// @nodoc
mixin _$LicenseCheckerPaymentModel {
  @JsonKey(name: 'status')
  PaymentStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_version')
  double? get targetVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'should_check_after_paid')
  bool get shouldCheckAfterPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_during_trial')
  bool get checkDuringTrial => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire_date')
  DateTime? get expireDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'warning_date')
  DateTime? get warningDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'strict_max_launch')
  bool get strictMaxLaunch => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_launch')
  int? get maxLaunch => throw _privateConstructorUsedError;
  @JsonKey(name: 'developer_details')
  Map<String, dynamic>? get developerDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_fields')
  Map<String, dynamic>? get additionalFields =>
      throw _privateConstructorUsedError;

  /// Serializes this LicenseCheckerPaymentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LicenseCheckerPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LicenseCheckerPaymentModelCopyWith<LicenseCheckerPaymentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseCheckerPaymentModelCopyWith<$Res> {
  factory $LicenseCheckerPaymentModelCopyWith(LicenseCheckerPaymentModel value,
          $Res Function(LicenseCheckerPaymentModel) then) =
      _$LicenseCheckerPaymentModelCopyWithImpl<$Res,
          LicenseCheckerPaymentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') PaymentStatus? status,
      @JsonKey(name: 'target_version') double? targetVersion,
      @JsonKey(name: 'should_check_after_paid') bool shouldCheckAfterPaid,
      @JsonKey(name: 'check_during_trial') bool checkDuringTrial,
      @JsonKey(name: 'expire_date') DateTime? expireDateTime,
      @JsonKey(name: 'warning_date') DateTime? warningDate,
      @JsonKey(name: 'strict_max_launch') bool strictMaxLaunch,
      @JsonKey(name: 'max_launch') int? maxLaunch,
      @JsonKey(name: 'developer_details')
      Map<String, dynamic>? developerDetails,
      @JsonKey(name: 'additional_fields')
      Map<String, dynamic>? additionalFields});
}

/// @nodoc
class _$LicenseCheckerPaymentModelCopyWithImpl<$Res,
        $Val extends LicenseCheckerPaymentModel>
    implements $LicenseCheckerPaymentModelCopyWith<$Res> {
  _$LicenseCheckerPaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LicenseCheckerPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? targetVersion = freezed,
    Object? shouldCheckAfterPaid = null,
    Object? checkDuringTrial = null,
    Object? expireDateTime = freezed,
    Object? warningDate = freezed,
    Object? strictMaxLaunch = null,
    Object? maxLaunch = freezed,
    Object? developerDetails = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus?,
      targetVersion: freezed == targetVersion
          ? _value.targetVersion
          : targetVersion // ignore: cast_nullable_to_non_nullable
              as double?,
      shouldCheckAfterPaid: null == shouldCheckAfterPaid
          ? _value.shouldCheckAfterPaid
          : shouldCheckAfterPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      checkDuringTrial: null == checkDuringTrial
          ? _value.checkDuringTrial
          : checkDuringTrial // ignore: cast_nullable_to_non_nullable
              as bool,
      expireDateTime: freezed == expireDateTime
          ? _value.expireDateTime
          : expireDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      warningDate: freezed == warningDate
          ? _value.warningDate
          : warningDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      strictMaxLaunch: null == strictMaxLaunch
          ? _value.strictMaxLaunch
          : strictMaxLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
      maxLaunch: freezed == maxLaunch
          ? _value.maxLaunch
          : maxLaunch // ignore: cast_nullable_to_non_nullable
              as int?,
      developerDetails: freezed == developerDetails
          ? _value.developerDetails
          : developerDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      additionalFields: freezed == additionalFields
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppPaymentModelImplCopyWith<$Res>
    implements $LicenseCheckerPaymentModelCopyWith<$Res> {
  factory _$$AppPaymentModelImplCopyWith(_$AppPaymentModelImpl value,
          $Res Function(_$AppPaymentModelImpl) then) =
      __$$AppPaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') PaymentStatus? status,
      @JsonKey(name: 'target_version') double? targetVersion,
      @JsonKey(name: 'should_check_after_paid') bool shouldCheckAfterPaid,
      @JsonKey(name: 'check_during_trial') bool checkDuringTrial,
      @JsonKey(name: 'expire_date') DateTime? expireDateTime,
      @JsonKey(name: 'warning_date') DateTime? warningDate,
      @JsonKey(name: 'strict_max_launch') bool strictMaxLaunch,
      @JsonKey(name: 'max_launch') int? maxLaunch,
      @JsonKey(name: 'developer_details')
      Map<String, dynamic>? developerDetails,
      @JsonKey(name: 'additional_fields')
      Map<String, dynamic>? additionalFields});
}

/// @nodoc
class __$$AppPaymentModelImplCopyWithImpl<$Res>
    extends _$LicenseCheckerPaymentModelCopyWithImpl<$Res,
        _$AppPaymentModelImpl> implements _$$AppPaymentModelImplCopyWith<$Res> {
  __$$AppPaymentModelImplCopyWithImpl(
      _$AppPaymentModelImpl _value, $Res Function(_$AppPaymentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LicenseCheckerPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? targetVersion = freezed,
    Object? shouldCheckAfterPaid = null,
    Object? checkDuringTrial = null,
    Object? expireDateTime = freezed,
    Object? warningDate = freezed,
    Object? strictMaxLaunch = null,
    Object? maxLaunch = freezed,
    Object? developerDetails = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_$AppPaymentModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus?,
      targetVersion: freezed == targetVersion
          ? _value.targetVersion
          : targetVersion // ignore: cast_nullable_to_non_nullable
              as double?,
      shouldCheckAfterPaid: null == shouldCheckAfterPaid
          ? _value.shouldCheckAfterPaid
          : shouldCheckAfterPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      checkDuringTrial: null == checkDuringTrial
          ? _value.checkDuringTrial
          : checkDuringTrial // ignore: cast_nullable_to_non_nullable
              as bool,
      expireDateTime: freezed == expireDateTime
          ? _value.expireDateTime
          : expireDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      warningDate: freezed == warningDate
          ? _value.warningDate
          : warningDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      strictMaxLaunch: null == strictMaxLaunch
          ? _value.strictMaxLaunch
          : strictMaxLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
      maxLaunch: freezed == maxLaunch
          ? _value.maxLaunch
          : maxLaunch // ignore: cast_nullable_to_non_nullable
              as int?,
      developerDetails: freezed == developerDetails
          ? _value._developerDetails
          : developerDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      additionalFields: freezed == additionalFields
          ? _value._additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppPaymentModelImpl implements _AppPaymentModel {
  const _$AppPaymentModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'target_version') this.targetVersion,
      @JsonKey(name: 'should_check_after_paid')
      this.shouldCheckAfterPaid = false,
      @JsonKey(name: 'check_during_trial') this.checkDuringTrial = false,
      @JsonKey(name: 'expire_date') this.expireDateTime,
      @JsonKey(name: 'warning_date') this.warningDate,
      @JsonKey(name: 'strict_max_launch') this.strictMaxLaunch = true,
      @JsonKey(name: 'max_launch') this.maxLaunch,
      @JsonKey(name: 'developer_details')
      final Map<String, dynamic>? developerDetails,
      @JsonKey(name: 'additional_fields')
      final Map<String, dynamic>? additionalFields})
      : _developerDetails = developerDetails,
        _additionalFields = additionalFields;

  factory _$AppPaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppPaymentModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final PaymentStatus? status;
  @override
  @JsonKey(name: 'target_version')
  final double? targetVersion;
  @override
  @JsonKey(name: 'should_check_after_paid')
  final bool shouldCheckAfterPaid;
  @override
  @JsonKey(name: 'check_during_trial')
  final bool checkDuringTrial;
  @override
  @JsonKey(name: 'expire_date')
  final DateTime? expireDateTime;
  @override
  @JsonKey(name: 'warning_date')
  final DateTime? warningDate;
  @override
  @JsonKey(name: 'strict_max_launch')
  final bool strictMaxLaunch;
  @override
  @JsonKey(name: 'max_launch')
  final int? maxLaunch;
  final Map<String, dynamic>? _developerDetails;
  @override
  @JsonKey(name: 'developer_details')
  Map<String, dynamic>? get developerDetails {
    final value = _developerDetails;
    if (value == null) return null;
    if (_developerDetails is EqualUnmodifiableMapView) return _developerDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _additionalFields;
  @override
  @JsonKey(name: 'additional_fields')
  Map<String, dynamic>? get additionalFields {
    final value = _additionalFields;
    if (value == null) return null;
    if (_additionalFields is EqualUnmodifiableMapView) return _additionalFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'LicenseCheckerPaymentModel(status: $status, targetVersion: $targetVersion, shouldCheckAfterPaid: $shouldCheckAfterPaid, checkDuringTrial: $checkDuringTrial, expireDateTime: $expireDateTime, warningDate: $warningDate, strictMaxLaunch: $strictMaxLaunch, maxLaunch: $maxLaunch, developerDetails: $developerDetails, additionalFields: $additionalFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPaymentModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.targetVersion, targetVersion) ||
                other.targetVersion == targetVersion) &&
            (identical(other.shouldCheckAfterPaid, shouldCheckAfterPaid) ||
                other.shouldCheckAfterPaid == shouldCheckAfterPaid) &&
            (identical(other.checkDuringTrial, checkDuringTrial) ||
                other.checkDuringTrial == checkDuringTrial) &&
            (identical(other.expireDateTime, expireDateTime) ||
                other.expireDateTime == expireDateTime) &&
            (identical(other.warningDate, warningDate) ||
                other.warningDate == warningDate) &&
            (identical(other.strictMaxLaunch, strictMaxLaunch) ||
                other.strictMaxLaunch == strictMaxLaunch) &&
            (identical(other.maxLaunch, maxLaunch) ||
                other.maxLaunch == maxLaunch) &&
            const DeepCollectionEquality()
                .equals(other._developerDetails, _developerDetails) &&
            const DeepCollectionEquality()
                .equals(other._additionalFields, _additionalFields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      targetVersion,
      shouldCheckAfterPaid,
      checkDuringTrial,
      expireDateTime,
      warningDate,
      strictMaxLaunch,
      maxLaunch,
      const DeepCollectionEquality().hash(_developerDetails),
      const DeepCollectionEquality().hash(_additionalFields));

  /// Create a copy of LicenseCheckerPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPaymentModelImplCopyWith<_$AppPaymentModelImpl> get copyWith =>
      __$$AppPaymentModelImplCopyWithImpl<_$AppPaymentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppPaymentModelImplToJson(
      this,
    );
  }
}

abstract class _AppPaymentModel implements LicenseCheckerPaymentModel {
  const factory _AppPaymentModel(
      {@JsonKey(name: 'status') final PaymentStatus? status,
      @JsonKey(name: 'target_version') final double? targetVersion,
      @JsonKey(name: 'should_check_after_paid') final bool shouldCheckAfterPaid,
      @JsonKey(name: 'check_during_trial') final bool checkDuringTrial,
      @JsonKey(name: 'expire_date') final DateTime? expireDateTime,
      @JsonKey(name: 'warning_date') final DateTime? warningDate,
      @JsonKey(name: 'strict_max_launch') final bool strictMaxLaunch,
      @JsonKey(name: 'max_launch') final int? maxLaunch,
      @JsonKey(name: 'developer_details')
      final Map<String, dynamic>? developerDetails,
      @JsonKey(name: 'additional_fields')
      final Map<String, dynamic>? additionalFields}) = _$AppPaymentModelImpl;

  factory _AppPaymentModel.fromJson(Map<String, dynamic> json) =
      _$AppPaymentModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  PaymentStatus? get status;
  @override
  @JsonKey(name: 'target_version')
  double? get targetVersion;
  @override
  @JsonKey(name: 'should_check_after_paid')
  bool get shouldCheckAfterPaid;
  @override
  @JsonKey(name: 'check_during_trial')
  bool get checkDuringTrial;
  @override
  @JsonKey(name: 'expire_date')
  DateTime? get expireDateTime;
  @override
  @JsonKey(name: 'warning_date')
  DateTime? get warningDate;
  @override
  @JsonKey(name: 'strict_max_launch')
  bool get strictMaxLaunch;
  @override
  @JsonKey(name: 'max_launch')
  int? get maxLaunch;
  @override
  @JsonKey(name: 'developer_details')
  Map<String, dynamic>? get developerDetails;
  @override
  @JsonKey(name: 'additional_fields')
  Map<String, dynamic>? get additionalFields;

  /// Create a copy of LicenseCheckerPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppPaymentModelImplCopyWith<_$AppPaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
