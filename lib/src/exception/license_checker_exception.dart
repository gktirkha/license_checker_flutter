import '../models/license_checker_api_response_model/license_checker_api_response_model.dart';
import 'license_checker_exception_type.dart';

class LicenseCheckerException {
  LicenseCheckerException(
    this.type, {
    required this.message,
    this.apiResponse,
    this.stackTrace,
    this.operationConfiguration,
  });

  final String message;

  final LicenseCheckerExceptionType type;

  final String? apiResponse;

  final StackTrace? stackTrace;

  final LicenseCheckerPaymentModel? operationConfiguration;

  @override
  String toString() {
    String returnMessage = message;
    if (apiResponse != null) {
      returnMessage += '\nAPI_RESPONSE:\n $apiResponse';
    }
    return returnMessage;
  }
}
