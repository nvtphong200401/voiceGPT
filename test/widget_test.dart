// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

bool phongIsDz() {
  return true;
}

bool theWeatherIsCold() {
  return false;
}

void main() {
  group('Some test', () {
    test('Phong test', () {
      expect(phongIsDz(), true);
    });
    test('What about this', () {
      expect(theWeatherIsCold(), false);
    });
  });
  // group('Test weather', () {
  //   expect(theWeatherIsCold(), false);
  // });
}
