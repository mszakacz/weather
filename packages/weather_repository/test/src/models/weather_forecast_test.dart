// ignore_for_file: use_named_constants

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
          wind: WeatherDataWind(
            speed: 1.1,
            deg: 120,
            gust: 2.3,
          ),
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
          wind: WeatherDataWind(
            speed: 1.1,
            deg: 120,
            gust: 2.3,
          ),
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
          wind: WeatherDataWind(
            speed: 1.1,
            deg: 120,
            gust: 2.3,
          ),
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
              iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
              condition: 'light rain',
              humidity: 69,
              pressure: 1015,
              windGust: 2.3,
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716379200000,
                isUtc: true,
              ).toLocal(),
              temperature: 24,
              iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
              condition: 'light rain',
              humidity: 69,
              pressure: 1015,
              windGust: 2.3,
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716390000000,
                isUtc: true,
              ).toLocal(),
              temperature: 22,
              iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
              condition: 'light rain',
              humidity: 69,
              pressure: 1015,
              windGust: 2.3,
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
              iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
              condition: 'light rain',
              humidity: 69,
              pressure: 1015,
              windGust: 2.3,
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716379200000,
                isUtc: true,
              ).toLocal(),
              temperature: 24,
              iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
              condition: 'light rain',
              humidity: 69,
              pressure: 1015,
              windGust: 2.3,
            ),
            Weather(
              time: DateTime.fromMillisecondsSinceEpoch(
                1716390000000,
                isUtc: true,
              ).toLocal(),
              temperature: 22,
              iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
              condition: 'light rain',
              humidity: 69,
              pressure: 1015,
              windGust: 2.3,
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
            iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
            condition: 'light rain',
            humidity: 69,
            pressure: 1015,
            windGust: 2.3,
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
              iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
              description: 'light rain',
            ),
          ],
        ),
      );
    });

    test('gets empty', () {
      expect(
        WeatherForecast.empty,
        equals(
          const WeatherForecast(
            city: '',
            moments: [],
          ),
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
