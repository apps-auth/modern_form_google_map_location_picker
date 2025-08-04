// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'package:flutter_test/flutter_test.dart';
import 'package:google_map_location_picker/google_map_location_picker_platform_interface.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
test('getPlatformVersion returns non-empty string', () async {
  final String? version = await GoogleMapLocationPickerPlatform.instance.getPlatformVersion();
  expect(version?.isNotEmpty, true);
});


}
