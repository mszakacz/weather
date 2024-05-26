import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/home/home.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../helpers/helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late HomeBloc homeBloc;

  final forecast = WeatherForecast(
    city: 'Warsaw',
    moments: [
      Weather(
        time: DateTime.fromMillisecondsSinceEpoch(
          1716390000000,
          isUtc: true,
        ).toLocal(),
        temperature: 24,
        iconUrl: '03d',
        condition: 'light rain',
        humidity: 69,
        pressure: 1015,
        windGust: 2.3,
      ),
    ],
  );

  setUp(() {
    homeBloc = MockHomeBloc();
    when(() => homeBloc.state).thenReturn(
      HomeState(
        status: HomeStatus.loading,
        weatherForecast: WeatherForecast.empty,
        selectedDay: DayWeather.empty,
      ),
    );
  });
  group('HomePage', () {
    Widget buildSubject() {
      final weatherRepository = MockWeatherRepository();

      return RepositoryProvider<WeatherRepository>.value(
        value: weatherRepository,
        child: BlocProvider.value(
          value: homeBloc,
          child: const HomePage(),
        ),
      );
    }

    testWidgets('renders HomeView', (tester) async {
      await tester.pumpApp(
        buildSubject(),
      );

      expect(find.byType(HomeView), findsOneWidget);
    });
  });

  group('HomeView', () {
    Widget buildSubject() {
      final weatherRepository = MockWeatherRepository();

      return RepositoryProvider<WeatherRepository>.value(
        value: weatherRepository,
        child: BlocProvider.value(
          value: homeBloc,
          child: const HomeView(),
        ),
      );
    }

    testWidgets('renders LoadingView when status is loading', (tester) async {
      await tester.pumpApp(buildSubject());

      expect(find.byType(LoadingView), findsOneWidget);
    });

    testWidgets('renders ErrorView when status is error', (tester) async {
      when(() => homeBloc.state).thenReturn(
        HomeState(
          status: HomeStatus.error,
          weatherForecast: WeatherForecast.empty,
          selectedDay: DayWeather.empty,
        ),
      );
      await tester.pumpApp(buildSubject());

      expect(find.byType(ErrorView), findsOneWidget);
    });

    testWidgets('renders PresentView when status is present', (tester) async {
      when(() => homeBloc.state).thenReturn(
        HomeState(
          status: HomeStatus.present,
          weatherForecast: forecast,
          selectedDay: forecast.days.first,
        ),
      );
      await tester.pumpApp(buildSubject());

      expect(find.byType(PresentView), findsOneWidget);
    });
  });
}
