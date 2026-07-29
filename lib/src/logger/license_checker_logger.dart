import 'dart:developer';

import '../license_checker_flutter.dart';

void licenseCheckerLogger(Object? e) =>
    log(e.toString(), name: LicenseCheckerFlutter.logTag);
