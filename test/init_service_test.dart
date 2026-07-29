import 'package:flutter_test/flutter_test.dart';
import 'package:license_checker_flutter/src/exception/license_checker_exception_type.dart';
import 'package:license_checker_flutter/src/exception/license_checker_flutter_exception.dart';
import 'package:license_checker_flutter/src/models/license_checker_config/license_checker_config.dart';
import 'package:license_checker_flutter/src/services/init_service.dart';

void main() {
  group('InitService.init', () {
    test('throws valueNotFound when jsonURL is empty', () {
      expect(
        () => InitService.init(
          LicenseCheckerConfig(jsonURL: '', appName: 'app', rulesVersion: 1),
        ),
        throwsA(
          isA<LicenseCheckerFlutterException>().having(
            (e) => e.type,
            'type',
            LicenseCheckerExceptionType.valueNotFound,
          ),
        ),
      );
    });

    test('throws valueNotFound when appName is empty', () {
      expect(
        () => InitService.init(
          LicenseCheckerConfig(
            jsonURL: 'https://example.com/license.json',
            appName: '',
            rulesVersion: 1,
          ),
        ),
        throwsA(
          isA<LicenseCheckerFlutterException>().having(
            (e) => e.type,
            'type',
            LicenseCheckerExceptionType.valueNotFound,
          ),
        ),
      );
    });

    test('throws valueNotFound when rulesVersion is not positive', () {
      expect(
        () => InitService.init(
          LicenseCheckerConfig(
            jsonURL: 'https://example.com/license.json',
            appName: 'app',
          ),
        ),
        throwsA(
          isA<LicenseCheckerFlutterException>().having(
            (e) => e.type,
            'type',
            LicenseCheckerExceptionType.valueNotFound,
          ),
        ),
      );
    });

    test('returns the resolved config when all fields are valid', () {
      final config = InitService.init(
        LicenseCheckerConfig(
          jsonURL: 'https://example.com/license.json',
          appName: 'app',
          rulesVersion: 2,
        ),
      );

      expect(config.jsonURL, 'https://example.com/license.json');
      expect(config.appName, 'app');
      expect(config.rulesVersion, 2);
    });
  });
}
