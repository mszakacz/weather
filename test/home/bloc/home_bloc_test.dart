import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/home/bloc/home_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('HomeBloc', () {
    late MockWeatherRepository weatherRepository;

    const units = Units.metric;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      when(() => weatherRepository.getUnits()).thenReturn(Units.metric);
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
        Weather(
          time: DateTime.fromMillisecondsSinceEpoch(
            1716400800000,
            isUtc: true,
          ).toLocal(),
          temperature: 18,
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
              units: units,
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
          units: units,
        ),
        act: (bloc) => bloc.add(
          const GetWeatherForecast(),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.present,
            weatherForecast: response,
            selectedDay: response.days.first,
            units: units,
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
          units: units,
        ),
        act: (bloc) => bloc.add(
          const GetWeatherForecast(),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.error,
            weatherForecast: WeatherForecast.empty,
            selectedDay: DayWeather.empty,
            units: units,
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
          units: units,
        ),
        act: (bloc) => bloc.add(
          SelectDay(dayWeather: dayWeather),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.present,
            weatherForecast: WeatherForecast.empty,
            selectedDay: dayWeather,
            units: units,
          ),
        ],
      );
    });

    group('SwitchUnits', () {
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
        'does not emit new state if units is null',
        build: buildBloc,
        seed: () => HomeState(
          status: HomeStatus.present,
          weatherForecast: WeatherForecast.empty,
          selectedDay: DayWeather.empty,
          units: units,
        ),
        act: (bloc) => bloc.add(
          const SwitchUnits(units: null),
        ),
        expect: () => <HomeState>[],
      );
      blocTest<HomeBloc, HomeState>(
        'emits error state when saveUnits fails',
        build: () {
          when(
            () => weatherRepository.saveUnits(Units.imperial),
          ).thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => HomeState(
          status: HomeStatus.present,
          weatherForecast: WeatherForecast.empty,
          selectedDay: dayWeather,
          units: Units.metric,
        ),
        act: (bloc) => bloc.add(
          const SwitchUnits(units: Units.imperial),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.loading,
            weatherForecast: WeatherForecast.empty,
            selectedDay: dayWeather,
            units: Units.metric,
          ),
          HomeState(
            status: HomeStatus.error,
            weatherForecast: WeatherForecast.empty,
            selectedDay: dayWeather,
            units: Units.metric,
          ),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'saves units and emits new present state',
        build: () {
          when(() => weatherRepository.saveUnits(Units.imperial))
              .thenAnswer((_) async {
            return;
          });
          when(
            () => weatherRepository.getWeatherForDeviceLocation(),
          ).thenAnswer(
            (_) async => response,
          );
          return buildBloc();
        },
        seed: () => HomeState(
          status: HomeStatus.present,
          weatherForecast: WeatherForecast.empty,
          selectedDay: dayWeather,
          units: Units.metric,
        ),
        act: (bloc) => bloc.add(
          const SwitchUnits(units: Units.imperial),
        ),
        expect: () => [
          HomeState(
            status: HomeStatus.loading,
            weatherForecast: WeatherForecast.empty,
            selectedDay: dayWeather,
            units: Units.metric,
          ),
          HomeState(
            status: HomeStatus.loading,
            weatherForecast: WeatherForecast.empty,
            selectedDay: dayWeather,
            units: Units.imperial,
          ),
          HomeState(
            status: HomeStatus.present,
            weatherForecast: response,
            selectedDay: response.days.first,
            units: Units.imperial,
          ),
        ],
      );
    });
  });
}
