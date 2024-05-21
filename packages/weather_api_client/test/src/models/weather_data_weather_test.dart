import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() {
  group('WeatherDataWeather', () {
    const icon = 'icon';
    const json = <String, dynamic>{
      'icon': icon,
    };

    WeatherDataWeather createSubject() => const WeatherDataWeather(
          icon: icon,
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

    test('fromJson works correctly', () {
      expect(
        WeatherDataWeather.fromJson(json),
        equals(createSubject()),
      );
    });

    test('toJson works correctly', () {
      expect(
        createSubject().toJson(),
        equals(json),
      );
    });
  });
}
