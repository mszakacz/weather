import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage/local_storage.dart';
import 'package:location_api_client/location_api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

class MockWeatherApiClient extends Mock implements WeatherApiClient {}

class MockLocationApiClient extends Mock implements LocationApiClient {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  group('WeatherRepository', () {
    late MockWeatherApiClient mockWeatherApiClient;
    late MockLocationApiClient mockLocationApiClient;
    late MockLocalStorage mockLocalStorage;

    late WeatherRepository repository;

    const lat = 37.423;
    const lon = -122.083;

    final position = Position(
      longitude: -122.083,
      latitude: 37.423,
      timestamp: DateTime.now(),
      accuracy: 2000,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 1,
      speed: 0,
      speedAccuracy: 0,
    );

    const data = WeatherForecastData(
      list: [
        WeatherData(
          dt: 1716390000,
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
      ],
      city: WeatherDataCity(name: 'Warsaw'),
    );

    final forecast = WeatherForecast(
      city: 'Warsaw',
      moments: [
        Weather(
          time: DateTime.fromMillisecondsSinceEpoch(
            1716390000000,
            isUtc: true,
          ).toLocal(),
          temperature: 24,
          iconUrl: 'https://openweathermap.org/img/wn/03d@4x.png',
          condition: 'light rain',
          humidity: 69,
          pressure: 1015,
          windGust: 2.3,
        ),
      ],
    );

    setUp(() {
      mockWeatherApiClient = MockWeatherApiClient();
      mockLocationApiClient = MockLocationApiClient();
      mockLocalStorage = MockLocalStorage();
      repository = WeatherRepository(
        weatherApiClient: mockWeatherApiClient,
        locationApiClient: mockLocationApiClient,
        localStorage: mockLocalStorage,
      );
    });

    WeatherRepository createSubject() => WeatherRepository(
          weatherApiClient: mockWeatherApiClient,
          locationApiClient: mockLocationApiClient,
          localStorage: mockLocalStorage,
        );

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          WeatherRepository(
            weatherApiClient: mockWeatherApiClient,
            locationApiClient: mockLocationApiClient,
            localStorage: mockLocalStorage,
          ),
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
          () => mockWeatherApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
            units: 'metric',
          ),
        ).thenAnswer((_) async => data);
        await repository.getWeatherForecast(
          lat: lat,
          lon: lon,
        );
        verify(
          () => mockWeatherApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
            units: 'metric',
          ),
        ).called(1);
      });

      test('returns WeatherForecast instance on valid response', () async {
        when(
          () => mockWeatherApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
            units: 'metric',
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
    group('getWeatherForDeviceLocation', () {
      test('call getCurrentLocation on locationApiClient', () async {
        when(
          () => mockLocationApiClient.getCurrentLocation(),
        ).thenAnswer((_) async => position);

        when(
          () => mockWeatherApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
            units: 'metric',
          ),
        ).thenAnswer((_) async => data);

        await repository.getWeatherForDeviceLocation();

        verify(
          () => mockLocationApiClient.getCurrentLocation(),
        ).called(1);
      });

      test('returns correct WeatherForecast instance', () async {
        when(
          () => mockLocationApiClient.getCurrentLocation(),
        ).thenAnswer((_) async => position);

        when(
          () => mockWeatherApiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
            units: 'metric',
          ),
        ).thenAnswer((_) async => data);

        final actual = await repository.getWeatherForDeviceLocation();

        expect(
          actual,
          equals(forecast),
        );
      });
    });
  });
}
