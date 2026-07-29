import '../enums/on_unhandled_reason.dart';
import '../exception/license_checker_flutter_exception.dart';
import '../models/license_checker_api_response_model/license_checker_api_response_model.dart';

typedef OnUnhandled =
    Function(
      OnUnhandledReason reason,
      LicenseCheckerPaymentModel? licenseCheckerPaymentModel,
    );

typedef OnException = Function(LicenseCheckerFlutterException exception);

typedef OnAppNotFound = Function();

typedef OnPaid =
    Function(LicenseCheckerPaymentModel licenseCheckerPaymentModel);

typedef OnUnPaid =
    Function(LicenseCheckerPaymentModel licenseCheckerPaymentModel);

typedef OnLimitedLaunch =
    Function(
      LicenseCheckerPaymentModel licenseCheckerPaymentModel,
      int currentCount,
    );

typedef OnLimitedLaunchExceeded =
    Function(LicenseCheckerPaymentModel licenseCheckerPaymentModel);

typedef OnTrial =
    Function(
      LicenseCheckerPaymentModel licenseCheckerPaymentModel,
      DateTime expiryDate,
      DateTime? warningDate,
    );

typedef OnTrialWarning =
    Function(
      LicenseCheckerPaymentModel licenseCheckerPaymentModel,
      DateTime expiryDate,
      DateTime warningDate,
    );

typedef OnTrialEnded =
    Function(
      LicenseCheckerPaymentModel licenseCheckerPaymentModel,
      DateTime expiryDate,
    );

typedef OnTargetVersionMisMatch =
    Function(
      LicenseCheckerPaymentModel licenseCheckerPaymentModel,
      double targetVersion,
      double configuredVersion,
    );
