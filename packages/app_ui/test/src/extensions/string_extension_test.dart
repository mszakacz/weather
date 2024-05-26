import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtension', () {
    group('capitalize', () {
      test('formats correctly', () {
        expect(
          'few clouds'.capitalize(),
          'Few clouds',
        );
      });
    });
  });
}
