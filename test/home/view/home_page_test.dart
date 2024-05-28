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
  late MockWeatherRepository weatherRepository;

  final forecast = WeatherForecast(
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
      Weather(
        time: DateTime.fromMillisecondsSinceEpoch(
          1716400800000,
          isUtc: true,
        ).toLocal(),
        temperature: 18,
        iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
        condition: 'light rain',
        humidity: 69,
        pressure: 1015,
        windGust: 2.3,
      ),
    ],
  );

  setUp(() {
    homeBloc = MockHomeBloc();
    weatherRepository = MockWeatherRepository();
    when(() => weatherRepository.getUnits()).thenReturn(Units.metric);
    when(() => homeBloc.state).thenReturn(
      HomeState(
        status: HomeStatus.loading,
        weatherForecast: WeatherForecast.empty,
        selectedDay: DayWeather.empty,
        units: Units.metric,
      ),
    );
  });
  group('HomePage', () {
    Widget buildSubject() {
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
          units: Units.metric,
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
          units: Units.metric,
        ),
      );
      await tester.pumpApp(buildSubject());

      expect(find.byType(PresentView), findsOneWidget);
    });
  });

  group('PresentView', () {
    final state = HomeState(
      status: HomeStatus.error,
      weatherForecast: forecast,
      selectedDay: forecast.days.first,
      units: Units.metric,
    );
    Widget buildSubject() {
      final weatherRepository = MockWeatherRepository();

      return RepositoryProvider<WeatherRepository>.value(
        value: weatherRepository,
        child: BlocProvider.value(
          value: homeBloc,
          child: PresentView(
            state: state,
          ),
        ),
      );
    }

    testWidgets('renders TopBar', (tester) async {
      when(() => homeBloc.state).thenReturn(state);
      await tester.pumpApp(buildSubject());

      expect(find.byType(TopBar), findsOneWidget);
    });

    testWidgets('renders WeatherDetailsWidget', (tester) async {
      when(() => homeBloc.state).thenReturn(state);
      await tester.pumpApp(buildSubject());

      expect(find.byType(WeatherDetailsWidget), findsOneWidget);
    });
    testWidgets('renders DaysList', (tester) async {
      when(() => homeBloc.state).thenReturn(state);
      await tester.pumpApp(buildSubject());

      expect(find.byType(DaysList), findsOneWidget);
    });
  });

  group('TopBar', () {
    final state = HomeState(
      status: HomeStatus.error,
      weatherForecast: forecast,
      selectedDay: forecast.days.first,
      units: Units.metric,
    );
    Widget buildSubject() {
      final weatherRepository = MockWeatherRepository();

      return RepositoryProvider<WeatherRepository>.value(
        value: weatherRepository,
        child: BlocProvider.value(
          value: homeBloc,
          child: TopBar(
            city: state.weatherForecast.city,
            units: Units.metric,
          ),
        ),
      );
    }

    testWidgets('renders LocationWidget', (tester) async {
      when(() => homeBloc.state).thenReturn(state);
      await tester.pumpApp(buildSubject());

      expect(find.byType(LocationWidget), findsOneWidget);
    });
  });

  group('LocationWidget', () {
    final state = HomeState(
      status: HomeStatus.error,
      weatherForecast: forecast,
      selectedDay: forecast.days.first,
      units: Units.metric,
    );
    const city = 'San Francisco';
    Widget buildSubject() {
      final weatherRepository = MockWeatherRepository();

      return RepositoryProvider<WeatherRepository>.value(
        value: weatherRepository,
        child: BlocProvider.value(
          value: homeBloc,
          child: const LocationWidget(
            city: city,
          ),
        ),
      );
    }

    testWidgets('renders Text with correct city name', (tester) async {
      when(() => homeBloc.state).thenReturn(state);
      await tester.pumpApp(buildSubject());

      expect(find.byType(Text), findsOneWidget);
      final textWidget = tester.widget<Text>(
        find.byType(Text),
      );

      expect(textWidget.data, city);
    });
  });

  group('ErrorView', () {
    final state = HomeState(
      status: HomeStatus.error,
      weatherForecast: forecast,
      selectedDay: forecast.days.first,
      units: Units.metric,
    );

    Widget buildSubject() {
      final weatherRepository = MockWeatherRepository();

      return RepositoryProvider<WeatherRepository>.value(
        value: weatherRepository,
        child: BlocProvider.value(
          value: homeBloc,
          child: const ErrorView(),
        ),
      );
    }

    testWidgets('renders retry Button', (tester) async {
      when(() => homeBloc.state).thenReturn(state);
      await tester.pumpApp(buildSubject());

      expect(find.byType(Button), findsOneWidget);
    });

    testWidgets('renders error Text', (tester) async {
      when(() => homeBloc.state).thenReturn(state);
      await tester.pumpApp(buildSubject());

      expect(find.text('Ups... Something went wrong'), findsOneWidget);
    });
  });
}
