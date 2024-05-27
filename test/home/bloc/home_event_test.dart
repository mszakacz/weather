import 'package:flutter_test/flutter_test.dart';

import 'package:weather/home/bloc/home_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  group('HomeEvent', () {
    group('GetWeatherForecast', () {
      test('supports value equality', () {
        expect(
          const GetWeatherForecast(),
          equals(const GetWeatherForecast()),
        );
      });
    });

    group('SelectDay', () {
      final dayWeather = DayWeather(
        day: DateTime(2024, 5, 22),
        maxTemperature: 24,
        minTemperature: 20,
        iconUrl: 'url',
        condition: 'few clouds',
        humidity: 69,
        pressure: 1015,
        windGust: 2.3,
      );
      test('supports value equality', () {
        expect(
          SelectDay(dayWeather: dayWeather),
          equals(
            SelectDay(dayWeather: dayWeather),
          ),
        );
      });
      test('props are correct', () {
        expect(
          SelectDay(dayWeather: dayWeather).props,
          equals(<Object?>[
            dayWeather,
          ]),
        );
      });
    });
  });
}
