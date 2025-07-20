import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:license_checker_flutter/license_checker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LicenseCheckerFlutter.init(
    jsonUrl: "https://raw.githubusercontent.com/gktirkha/license_checker_flutter/refs/heads/master/assets/example-hosted.json",
    appName: "trial_expire",
    version: 1,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              LicenseCheckerFlutter.checkStatus(
                onException: (exception) {
                  log(exception.toString(), name: "onException");
                },
                onUnhandled: (reason, licenseCheckerPaymentModel) {
                  log(reason.name, name: "onUnhandled");
                  log(licenseCheckerPaymentModel.toString(), name: "onUnhandled");
                },
                onAppNotFound: () {
                  log("onAppNotFound", name: "onAppNotFound");
                },
                onLimitedLaunch: (licenseCheckerPaymentModel, currentCount) {
                  log(currentCount.toString(), name: "onLimitedLaunch");
                  log(licenseCheckerPaymentModel.toString(), name: "onLimitedLaunch");
                },
                onLimitedLaunchExceeded: (licenseCheckerPaymentModel) {
                  log(licenseCheckerPaymentModel.toString(), name: "onLimitedLaunchExceeded");
                },
                onPaid: (licenseCheckerPaymentModel) {
                  log(licenseCheckerPaymentModel.toString(), name: "onPaid");
                },
                onTargetVersionMisMatch: (licenseCheckerPaymentModel, targetVersion, configuredVersion) {
                  log(licenseCheckerPaymentModel.toString(), name: "onTargetVersionMisMatch");
                  log(targetVersion.toString(), name: "onTargetVersionMisMatch Target Version");
                  log(configuredVersion.toString(), name: "onTargetVersionMisMatch Configured Version");
                },
                onTrial: (licenseCheckerPaymentModel, expiryDate, warningDate) {
                  log(licenseCheckerPaymentModel.toString(), name: "onTrial");
                  log(expiryDate.toString(), name: "onTrial expiryDate");
                  log(warningDate.toString(), name: "onTrial warningDate");
                },
                onTrialEnded: (licenseCheckerPaymentModel, expiryDate) {
                  log(licenseCheckerPaymentModel.toString(), name: "onTrialEnded");
                  log(expiryDate.toString(), name: "onTrialEnded expiryDate");
                },
                onTrialWarning: (licenseCheckerPaymentModel, expiryDate, warningDate) {
                  log(licenseCheckerPaymentModel.toString(), name: "onTrialWarning");
                  log(expiryDate.toString(), name: "onTrialWarning expiryDate");
                  log(warningDate.toString(), name: "onTrialWarning warningDate");
                },
                onUnPaid: (licenseCheckerPaymentModel) {
                  log(licenseCheckerPaymentModel.toString(), name: "onUnPaid");
                },
              );
            },
            child: const Text("Check App"),
          ),
        ),
      ),
    );
  }
}
