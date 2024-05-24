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
            humidity: 69,
            pressure: 1015,
          ),
          weather: [
            WeatherDataWeather(
              icon: '03d',
              description: 'light rain',
            ),
          ],
        ),
        WeatherData(
          dt: 1716379200,
          main: WeatherDataMain(
            temp: 24,
            humidity: 69,
            pressure: 1015,
          ),
          weather: [
            WeatherDataWeather(
              icon: '03d',
              description: 'light rain',
            ),
          ],
        ),
        WeatherData(
          dt: 1716390000,
          main: WeatherDataMain(
            temp: 22,
            humidity: 69,
            pressure: 1015,
          ),
          weather: [
            WeatherDataWeather(
              icon: '03d',
              description: 'light rain',
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
              time: DateTime.fromMillisecondsSinceEpoch(
                1716368400000,
                isUtc: true,
              ).toLocal(),
              temperature: 18,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716379200000,
                isUtc: true,
              ).toLocal(),
              temperature: 24,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716390000000,
                isUtc: true,
              ).toLocal(),
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
              time: DateTime.fromMillisecondsSinceEpoch(
                1716368400000,
                isUtc: true,
              ).toLocal(),
              temperature: 18,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716379200000,
                isUtc: true,
              ).toLocal(),
              temperature: 24,
              iconUrl: '03d',
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716390000000,
                isUtc: true,
              ).toLocal(),
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
            time: DateTime.fromMillisecondsSinceEpoch(
              1716368400000,
              isUtc: true,
            ).toLocal(),
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
              day: DateTime.fromMillisecondsSinceEpoch(
                1716368400000,
                isUtc: true,
              ).toLocal(),
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
