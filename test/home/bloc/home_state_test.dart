// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:weather/home/bloc/home_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  group('HomeState', () {
    HomeState createSubject({
      HomeStatus? status,
      WeatherForecast? weatherForecast,
      DayWeather? selectedDay,
      Units? units,
    }) {
      return HomeState(
        status: status ?? HomeStatus.present,
        weatherForecast: weatherForecast ?? WeatherForecast.empty,
        selectedDay: selectedDay ?? DayWeather.empty,
        units: units ?? Units.metric,
      );
    }

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
          HomeStatus.present,
          WeatherForecast.empty,
          DayWeather.empty,
          Units.metric,
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            status: null,
            weatherForecast: null,
            selectedDay: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            status: HomeStatus.loading,
            weatherForecast: const WeatherForecast(
              city: 'new city',
              moments: [],
            ),
            selectedDay: DayWeather(
              day: DateTime(2024, 4, 5),
              maxTemperature: 20,
              minTemperature: 18,
              iconUrl: 'iconUrl',
              condition: 'few clouds',
              humidity: 69,
              pressure: 1015,
              windGust: 2.3,
            ),
            units: Units.imperial,
          ),
          equals(
            createSubject(
              status: HomeStatus.loading,
              weatherForecast: const WeatherForecast(
                city: 'new city',
                moments: [],
              ),
              selectedDay: DayWeather(
                day: DateTime(2024, 4, 5),
                maxTemperature: 20,
                minTemperature: 18,
                iconUrl: 'iconUrl',
                condition: 'few clouds',
                humidity: 69,
                pressure: 1015,
                windGust: 2.3,
              ),
              units: Units.imperial,
            ),
          ),
        );
      });
    });
  });
}
