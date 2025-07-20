// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/payment_status.dart';

part 'payment_status_model.freezed.dart';
part 'payment_status_model.g.dart';

/// Represents the API response model for LicenseChecker payment status.
///
/// This model encapsulates the data structure returned by the payment status API,
/// including a map of application payment models.
@freezed
class LicenseCheckerApiResponseModel with _$LicenseCheckerApiResponseModel {
  /// Creates an instance of [LicenseCheckerApiResponseModel].
  ///
  /// [apps] - A map of application identifiers to their corresponding
  /// [LicenseCheckerPaymentModel] instances, representing the payment statuses of the apps.
  const factory LicenseCheckerApiResponseModel({
    @JsonKey(name: 'apps') Map<String, LicenseCheckerPaymentModel>? apps,
  }) = _LicenseCheckerApiResponseModel;

  /// Creates a [LicenseCheckerApiResponseModel] from a JSON map.
  ///
  /// [json] - The JSON map containing the payment status data.
  factory LicenseCheckerApiResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LicenseCheckerApiResponseModelFromJson(json);
}

/// Represents the payment model for a LicenseChecker application.
///
/// This model includes the payment status and configuration details for an application.
@freezed
class LicenseCheckerPaymentModel with _$LicenseCheckerPaymentModel {
  /// Creates an instance of [LicenseCheckerPaymentModel].
  ///
  /// [status] - The payment status of the application, represented by
  /// the [PaymentStatus] enum.
  /// [targetVersion] - The target version required for the application.
  /// [shouldCheckAfterPaid] - Whether to check the status after payment
  /// has been made (defaults to false).
  /// [checkDuringTrial] - Indicates if checks should occur during the trial period (defaults to false).
  /// [expireDateTime] - The expiration date of the application, if applicable.
  /// [warningDate] - The warning date for impending expiration, if applicable.
  /// [strictMaxLaunch] - Whether to enforce strict maximum launches
  /// (defaults to true).
  /// [maxLaunch] - The maximum number of launches allowed for the application.
  /// [developerDetails] - developer details.
  /// [additionalFields] - custom user defined fields.
  const factory LicenseCheckerPaymentModel({
    @JsonKey(name: 'status') PaymentStatus? status,
    @JsonKey(name: 'target_version') double? targetVersion,
    @Default(false) @JsonKey(name: 'should_check_after_paid') bool shouldCheckAfterPaid,
    @Default(false) @JsonKey(name: 'check_during_trial') bool checkDuringTrial,
    @JsonKey(name: 'expire_date') DateTime? expireDateTime,
    @JsonKey(name: 'warning_date') DateTime? warningDate,
    @Default(true) @JsonKey(name: 'strict_max_launch') bool strictMaxLaunch,
    @JsonKey(name: 'max_launch') int? maxLaunch,
    @JsonKey(name: 'developer_details') Map<String, dynamic>? developerDetails,
    @JsonKey(name: 'additional_fields') Map<String, dynamic>? additionalFields,
  }) = _AppPaymentModel;

  /// Creates a [LicenseCheckerPaymentModel] from a JSON map.
  ///
  /// [json] - The JSON map containing the payment model data.
  factory LicenseCheckerPaymentModel.fromJson(Map<String, dynamic> json) => _$LicenseCheckerPaymentModelFromJson(json);
}
