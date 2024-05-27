import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/home/bloc/home_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('HomeBloc', () {
    late MockWeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    HomeBloc buildBloc() {
      return HomeBloc(
        weatherRepository: weatherRepository,
      );
    }

    final response = WeatherForecast(
      city: 'Warsaw',
      moments: [
        Weather(
          time: DateTime.fromMillisecondsSinceEpoch(
            1716368400000,
            isUtc: true,
          ).toLocal(),
          temperature: 18,
          iconUrl: '03d',
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
          iconUrl: '03d',
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
          iconUrl: '03d',
          condition: 'light rain',
          humidity: 69,
          pressure: 1015,
          windGust: 2.3,
        ),
      ],
    );

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(
            HomeState(
              status: HomeStatus.loading,
              weatherForecast: WeatherForecast.empty,
              selectedDay: DayWeather.empty,
            ),
          ),
        );
      });
    });

    group('GetWeatherForecast', () {
      blocTest<HomeBloc, HomeState>(
        'calls repository and emits new state with update',
        setUp: () {
          when(
            () => weatherRepository.getWeatherForDeviceLocation(),
          ).thenAnswer(
            (_) async => response,
          );
        },
        build: buildBloc,
        seed: () => HomeState(
          status: HomeStatus.loading,
          weatherForecast: WeatherForecast.empty,
          selectedDay: DayWeather.empty,
        ),
        act: (bloc) => bloc.add(
          const GetWeatherForecast(),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.present,
            weatherForecast: response,
            selectedDay: response.days.first,
          ),
        ],
        verify: (bloc) {
          verify(
            () => weatherRepository.getWeatherForDeviceLocation(),
          ).called(1);
        },
      );

      blocTest<HomeBloc, HomeState>(
        'emits new state with error',
        build: () {
          when(
            () => weatherRepository.getWeatherForDeviceLocation(),
          ).thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => HomeState(
          status: HomeStatus.loading,
          weatherForecast: WeatherForecast.empty,
          selectedDay: DayWeather.empty,
        ),
        act: (bloc) => bloc.add(
          const GetWeatherForecast(),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.error,
            weatherForecast: WeatherForecast.empty,
            selectedDay: DayWeather.empty,
          ),
        ],
      );
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
      blocTest<HomeBloc, HomeState>(
        'emits new state with updated selectedDay',
        build: buildBloc,
        seed: () => HomeState(
          status: HomeStatus.present,
          weatherForecast: WeatherForecast.empty,
          selectedDay: DayWeather.empty,
        ),
        act: (bloc) => bloc.add(
          SelectDay(dayWeather: dayWeather),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.present,
            weatherForecast: WeatherForecast.empty,
            selectedDay: dayWeather,
          ),
        ],
      );
    });
  });
}
