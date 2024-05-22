import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  group('WeatherForecast', () {
    const data = WeatherForecastData(
      list: [
        WeatherData(
          dt: 1716368400,
          main: WeatherDataMain(
            temp: 18,
          ),
          weather: [
            WeatherDataWeather(
              icon: '03d',
            ),
          ],
        ),
        WeatherData(
          dt: 1716379200,
          main: WeatherDataMain(
            temp: 24,
          ),
          weather: [
            WeatherDataWeather(
              icon: '03d',
            ),
          ],
        ),
        WeatherData(
          dt: 1716390000,
          main: WeatherDataMain(
            temp: 22,
          ),
          weather: [
            WeatherDataWeather(
              icon: '03d',
            ),
          ],
        ),
      ],
      city: WeatherDataCity(name: 'Warsaw'),
    );

    WeatherForecast createSubject() => WeatherForecast(
          city: 'Warsaw',
          moments: [
            Weather(
              time: DateTime(2024, 5, 22, 11),
              temperature: 18,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime(2024, 5, 22, 14),
              temperature: 24,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime(2024, 5, 22, 17),
              temperature: 22,
              iconUrl: '03d',
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

    test('props are correct', () {
      expect(
        createSubject().props,
        equals([
          'Warsaw',
          [
            Weather(
              time: DateTime(2024, 5, 22, 11),
              temperature: 18,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime(2024, 5, 22, 14),
              temperature: 24,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime(2024, 5, 22, 17),
              temperature: 22,
              iconUrl: '03d',
            ),
          ],
        ]),
      );
    });

    test('gets current', () {
      expect(
        createSubject().current,
        equals(
          Weather(
            time: DateTime(2024, 5, 22, 11),
            temperature: 18,
            iconUrl: '03d',
          ),
        ),
      );
    });

    test('gets days', () {
      expect(
        createSubject().days,
        equals(
          [
            DayWeather(
              day: DateTime(2024, 5, 22, 11),
              maxTemperature: 24,
              minTemperature: 18,
              iconUrl: '03d',
            ),
          ],
        ),
      );
    });

    test('fromData works correctly', () {
      expect(
        WeatherForecast.fromData(data),
        equals(createSubject()),
      );
    });
  });
}
