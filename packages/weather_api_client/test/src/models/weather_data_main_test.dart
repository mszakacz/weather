import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() {
  group('WeatherDataMain', () {
    const json = <String, dynamic>{
      'temp': 25,
    };

    WeatherDataMain createSubject() => const WeatherDataMain(
          temp: 25,
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
        WeatherDataMain.fromJson(json),
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
