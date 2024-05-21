import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() {
  group('WeatherForecastData', () {
    const cityName = 'Milan';
    const dt = 1200;
    const temp = 25.0;
    const icon = 'icon';

    const json = <String, dynamic>{
      'list': [
        {
          'dt': dt,
          'main': {'temp': temp},
          'weather': [
            {'icon': icon},
          ],
        },
      ],
      'city': {
        'name': cityName,
      },
    };

    WeatherForecastData createSubject() => const WeatherForecastData(
          city: WeatherDataCity(
            name: cityName,
          ),
          list: [
            WeatherData(
              dt: 1200,
              main: WeatherDataMain(
                temp: temp,
              ),
              weather: [
                WeatherDataWeather(
                  icon: icon,
                ),
              ],
            ),
          ],
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
        WeatherForecastData.fromJson(json),
        equals(createSubject()),
      );
    });
  });
}
