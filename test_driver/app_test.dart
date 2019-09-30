import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('My first test group', () {

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      driver.setSemantics(true);
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('validate accessibility', () async {
      final imageLabel = find.bySemanticsLabel('Company logo');
      int id = await driver.getSemanticsId(imageLabel);
      print(id);
      expect(await driver.getSemanticsId(imageLabel), isNotNull);
      await driver.tap(imageLabel);
      print('tapped on image');
    });
  });
}