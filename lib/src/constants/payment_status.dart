// ignore_for_file: constant_identifier_names
library license_checker_flutter;

/// Enumeration representing the possible payment statuses of an application.
enum PaymentStatus {
  /// Indicates that the application is in a paid state.
  PAID,

  /// Indicates that the application is in an unpaid state.
  UNPAID,

  /// Indicates that the application allows limited launches.
  ALLOW_LIMITED_LAUNCHES,

  /// Indicates that the application is currently on a trial period.
  ON_TRIAL,
}
