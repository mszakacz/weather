import 'package:flutter_test/flutter_test.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  group('DayWeather', () {
    DayWeather createSubject() => DayWeather(
          day: DateTime(2024, 5, 22),
          maxTemperature: 24,
          minTemperature: 20,
          iconUrl: 'url',
          condition: 'few clouds',
          humidity: 69,
          pressure: 1015,
          windGust: 2.3,
        );

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject().props,
        equals([
          DateTime(2024, 5, 22),
          24,
          20,
          'url',
          'few clouds',
          69,
          1015,
          2.3,
        ]),
      );
    });
    test('gets empty', () {
      expect(
        DayWeather.empty,
        equals(
          DayWeather(
            day: DateTime(2024),
            maxTemperature: 20,
            minTemperature: 16,
            iconUrl: '',
            condition: '',
            humidity: 0,
            pressure: 0,
            windGust: 0,
          ),
        ),
      );
    });
  });
}
