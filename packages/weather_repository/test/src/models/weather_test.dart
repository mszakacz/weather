import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  group('Weather', () {
    const data = WeatherData(
      dt: 1716390000,
      main: WeatherDataMain(
        temp: 22,
      ),
      weather: [
        WeatherDataWeather(
          icon: '03d',
        ),
      ],
    );

    Weather createSubject() => Weather(
          time: DateTime(2024, 5, 22, 17),
          temperature: 22,
          iconUrl: '03d',
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
          DateTime(2024, 5, 22, 17),
          22,
          '03d',
        ]),
      );
    });

    test('fromData works correctly', () {
      expect(
        Weather.fromData(data),
        equals(createSubject()),
      );
    });
  });
}
