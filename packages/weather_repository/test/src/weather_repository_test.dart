import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

class MockApiClient extends Mock implements WeatherApiClient {}

void main() {
  group('WeatherRepository', () {
    late MockApiClient mockApiClient;
    late WeatherRepository repository;

    const lat = 53.13;
    const lon = 23.168;

    const data = WeatherForecastData(
      list: [
        WeatherData(
          dt: 1716390000,
          main: WeatherDataMain(
            temp: 24,
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

    final forecast = WeatherForecast(
      city: 'Warsaw',
      moments: [
        Weather(
          time: DateTime(2024, 5, 22, 17),
          temperature: 24,
          iconUrl: '03d',
        ),
      ],
    );

    setUp(() {
      mockApiClient = MockApiClient();
      repository = WeatherRepository(weatherApiClient: mockApiClient);
    });

    WeatherRepository createSubject() => WeatherRepository(
          weatherApiClient: mockApiClient,
        );

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          WeatherRepository(weatherApiClient: mockApiClient),
          isNotNull,
        );
      });
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('getWeatherForecast', () {
      test('makes correct api request', () async {
        when(
          () => mockApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
          ),
        ).thenAnswer((_) async => data);
        await repository.getWeatherForecast(
          lat: lat,
          lon: lon,
        );
        verify(
          () => mockApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
          ),
        ).called(1);
      });

      test('returns WeatherForecast instance on valid response', () async {
        when(
          () => mockApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
          ),
        ).thenAnswer((_) async => data);

        final actual = await repository.getWeatherForecast(
          lat: lat,
          lon: lon,
        );

        expect(
          actual,
          forecast,
        );
      });
    });
  });
}
