import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() {
  group('WeatherDataWind', () {
    const json = <String, dynamic>{
      'speed': 0.62,
      'deg': 349,
      'gust': 1.18,
    };

    WeatherDataWind createSubject() => const WeatherDataWind(
          speed: 0.62,
          deg: 349,
          gust: 1.18,
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
        WeatherDataWind.fromJson(json),
        equals(createSubject()),
      );
    });
  });
}
