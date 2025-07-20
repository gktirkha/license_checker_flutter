import '../../license_checker_flutter.dart';

/// Callback type for handling unhandled cases.
///
/// This function is invoked when an unexpected situation occurs,
/// providing the reason for the unhandled case and the associated payment model.
typedef OnUnhandled = Function(
  OnUnhandledReason reason,
  LicenseCheckerPaymentModel? licenseCheckerPaymentModel,
);

/// Callback type for handling exceptions.
///
/// This function is invoked when a [LicenseCheckerFlutterException] occurs,
/// allowing for custom error handling.
typedef OnException = Function(LicenseCheckerFlutterException exception);

/// Callback type for when the application is not found.
///
/// This function is called when the application cannot be located in the configuration.
typedef OnAppNotFound = Function();

/// Callback type for handling paid application status.
///
/// This function is invoked when the application is in a paid state,
/// providing the relevant payment model.
typedef OnPaid = Function(LicenseCheckerPaymentModel licenseCheckerPaymentModel);

/// Callback type for handling unpaid application status.
///
/// This function is invoked when the application is in an unpaid state,
/// providing the relevant payment model.
typedef OnUnPaid = Function(LicenseCheckerPaymentModel licenseCheckerPaymentModel);

/// Callback type for handling limited launch scenarios.
///
/// This function is invoked when the application is in a limited launch state,
/// providing the payment model and the current launch count.
typedef OnLimitedLaunch = Function(
  LicenseCheckerPaymentModel licenseCheckerPaymentModel,
  int currentCount,
);

/// Callback type for when the limited launch is exceeded.
///
/// This function is called when the application has exceeded its allowed launch count,
/// providing the relevant payment model.
typedef OnLimitedLaunchExceeded = Function(
  LicenseCheckerPaymentModel licenseCheckerPaymentModel,
);

/// Callback type for handling trial periods.
///
/// This function is invoked when the application is in a trial state,
/// providing the payment model, the trial expiry date, and an optional warning date.
typedef OnTrial = Function(
  LicenseCheckerPaymentModel licenseCheckerPaymentModel,
  DateTime expiryDate,
  DateTime? warningDate,
);

/// Callback type for handling trial warnings.
///
/// This function is invoked to notify about an impending trial expiry,
/// providing the payment model, the trial expiry date, and the warning date.
typedef OnTrialWarning = Function(
  LicenseCheckerPaymentModel licenseCheckerPaymentModel,
  DateTime expiryDate,
  DateTime warningDate,
);

/// Callback type for handling the end of a trial period.
///
/// This function is invoked when the trial period has ended,
/// providing the payment model and the trial expiry date.
typedef OnTrialEnded = Function(
  LicenseCheckerPaymentModel licenseCheckerPaymentModel,
  DateTime expiryDate,
);

/// Callback type for handling target version mismatches.
///
/// This function is invoked when there is a version mismatch between the target version
/// and the configured version, providing the payment model, the target version, and the configured version.
typedef OnTargetVersionMisMatch = Function(
  LicenseCheckerPaymentModel licenseCheckerPaymentModel,
  double targetVersion,
  double configuredVersion,
);
