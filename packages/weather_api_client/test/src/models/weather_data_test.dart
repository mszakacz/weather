import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() {
  group('WeatherData', () {
    const dt = 1200;
    const temp = 25.0;
    const humidity = 69;
    const pressure = 1015;
    const description = 'light rain';
    const icon = 'icon';
    const windSpeed = 1.14;
    const windDeg = 17;
    const windGust = 1.57;

    const json = <String, dynamic>{
      'dt': dt,
      'main': {
        'temp': temp,
        'humidity': humidity,
        'pressure': pressure,
      },
      'weather': [
        {
          'icon': icon,
          'description': description,
        },
      ],
      'wind': {
        'speed': windSpeed,
        'deg': windDeg,
        'gust': windGust,
      },
    };

    WeatherData createSubject() => const WeatherData(
          dt: 1200,
          main: WeatherDataMain(
            temp: temp,
            humidity: humidity,
            pressure: pressure,
          ),
          weather: [
            WeatherDataWeather(
              icon: icon,
              description: description,
            ),
          ],
          wind: WeatherDataWind(
            speed: windSpeed,
            deg: windDeg,
            gust: windGust,
          ),
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
        WeatherData.fromJson(json),
        equals(createSubject()),
      );
    });
  });
}
