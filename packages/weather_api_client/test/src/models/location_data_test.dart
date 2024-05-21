import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() {
  group('LocationData', () {
    const json = <String, dynamic>{
      'name': 'Milan',
      'country': 'IT',
      'lat': 51.51,
      'lon': -0.091,
    };

    LocationData createSubject() => const LocationData(
          name: 'Milan',
          country: 'IT',
          lat: 51.51,
          lon: -0.091,
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
        LocationData.fromJson(json),
        equals(createSubject()),
      );
    });
  });
}
