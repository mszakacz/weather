import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTimeExtension', () {
    group('dayNameShort', () {
      test('formats correctly', () {
        expect(
          DateTime(2024, 5, 26).dayNameShort,
          'Sun',
        );
        expect(
          DateTime(2024, 5, 27).dayNameShort,
          'Mon',
        );
        expect(
          DateTime(2024, 5, 28).dayNameShort,
          'Tue',
        );
      });
    });

    group('longDate', () {
      test('formats correctly', () {
        expect(
          DateTime(2024, 5, 26).longDate,
          'Sunday, 26 May',
        );
        expect(
          DateTime(2024, 5, 27).longDate,
          'Monday, 27 May',
        );
      });
    });
  });
}
