import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/payment_status.dart';

part 'license_checker_api_response_model.freezed.dart';
part 'license_checker_api_response_model.g.dart';

@freezed
sealed class LicenseCheckerApiResponseModel
    with _$LicenseCheckerApiResponseModel {
  factory LicenseCheckerApiResponseModel({
    @Default({})
    @JsonKey(name: 'apps')
    Map<String, LicenseCheckerPaymentModel>? apps,
  }) = _LicenseCheckerApiResponseModel;

  factory LicenseCheckerApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseCheckerApiResponseModelFromJson(json);
}

@freezed
sealed class LicenseCheckerPaymentModel with _$LicenseCheckerPaymentModel {
  const factory LicenseCheckerPaymentModel({
    @Default(PaymentStatus.UNKNOWN)
    @JsonKey(name: 'status', unknownEnumValue: PaymentStatus.UNKNOWN)
    PaymentStatus status,

    @Default(0) @JsonKey(name: 'target_version') double targetVersion,

    @Default(false)
    @JsonKey(name: 'should_check_after_paid')
    bool shouldCheckAfterPaid,

    @Default(false) @JsonKey(name: 'check_during_trial') bool checkDuringTrial,

    @JsonKey(name: 'expire_date') DateTime? expireDateTime,

    @JsonKey(name: 'warning_date') DateTime? warningDate,
    @Default(true) @JsonKey(name: 'strict_max_launch') bool strictMaxLaunch,

    @JsonKey(name: 'max_launch') int? maxLaunch,

    @Default({})
    @JsonKey(name: 'developer_details')
    Map<String, dynamic> developerDetails,

    @Default({})
    @JsonKey(name: 'additional_fields')
    Map<String, dynamic> additionalFields,
  }) = _AppPaymentModel;

  factory LicenseCheckerPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseCheckerPaymentModelFromJson(json);
}
