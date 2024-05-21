import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() {
  group('WeatherDataCity', () {
    const cityName = 'Milan';
    const json = <String, dynamic>{
      'name': cityName,
    };

    WeatherDataCity createSubject() => const WeatherDataCity(
          name: cityName,
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
        WeatherDataCity.fromJson(json),
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
