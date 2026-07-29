class LicenseCheckerException {
  LicenseCheckerException(this.type);

  final LicenseCheckerExceptionType type;
}

enum LicenseCheckerExceptionType { initFailed }
