import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:weather_api_client/weather_api_client.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('WeatherApiClient', () {
    late MockHttpClient mockHttpClient;
    late WeatherApiClient apiClient;

    const lat = 30.05;
    const lon = 45.01;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      mockHttpClient = MockHttpClient();
      apiClient = WeatherApiClient(httpClient: mockHttpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(WeatherApiClient(), isNotNull);
      });
    });

    group('getWeatherForecast', () {
      test('makes correct https request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => mockHttpClient.get(any())).thenAnswer((_) async => response);
        try {
          await apiClient.getWeatherForecast(
            lat: lat,
            lon: lon,
          );
        } catch (_) {}
        verify(
          () => mockHttpClient.get(
            Uri.https(
              'api.openweathermap.org',
              '/data/2.5/forecast',
              {
                'lat': lat.toString(),
                'lon': lon.toString(),
                'units': 'metric',
                'APPID': '',
              },
            ),
          ),
        ).called(1);
      });

      test(
        'throws GetWeatherForecastFailure on non-200 response',
        () async {
          final response = MockResponse();

          when(() => response.statusCode).thenReturn(400);
          when(() => mockHttpClient.get(any()))
              .thenAnswer((_) async => response);
          expect(
            () async => apiClient.getWeatherForecast(
              lat: lat,
              lon: lon,
            ),
            throwsA(isA<GetWeatherForecastFailure>()),
          );
        },
      );

      test(
        'throws WeatherForecastDeserializationFailure',
        () async {
          final response = MockResponse();
          when(() => response.statusCode).thenReturn(200);
          when(() => response.body).thenReturn(
            '''
  {
  'name': 'name',
  }
  ''',
          ); // some properties are missing

          when(() => mockHttpClient.get(any()))
              .thenAnswer((_) async => response);

          final actual = apiClient.getWeatherForecast(lat: lat, lon: lon);
          expect(
            actual,
            throwsA(
              isA<WeatherForecastDeserializationFailure>(),
            ),
          );
        },
      );

      test('returns WeatherForecastData on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);

        when(() => response.body).thenReturn(
          '''
  {
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1661871600,
      "main": {
        "temp": 296.76,
        "feels_like": 296.98,
        "temp_min": 296.76,
        "temp_max": 297.87,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 933,
        "humidity": 69,
        "temp_kf": -1.11
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 0.62,
        "deg": 349,
        "gust": 1.18
      },
      "visibility": 10000,
      "pop": 0.32,
      "rain": {
        "3h": 0.26
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-08-30 15:00:00"
    }
  ],
  "city": {
    "id": 3163858,
    "name": "Milan",
    "coord": {
      "lat": 44.34,
      "lon": 10.99
    },
    "country": "IT",
    "population": 4593,
    "timezone": 7200,
    "sunrise": 1661834187,
    "sunset": 1661882248
  }
}
  ''',
        );
        when(
          () => mockHttpClient.get(any()),
        ).thenAnswer((_) async => response);

        final actual = await apiClient.getWeatherForecast(
          lat: lat,
          lon: lon,
        );

        const expected = WeatherForecastData(
          list: [
            WeatherData(
              dt: 1661871600,
              main: WeatherDataMain(
                temp: 296.76,
                humidity: 69,
                pressure: 1015,
              ),
              weather: [
                WeatherDataWeather(
                  icon: '10d',
                  description: 'light rain',
                ),
              ],
              wind: WeatherDataWind(
                speed: 0.62,
                deg: 349,
                gust: 1.18,
              ),
            ),
          ],
          city: WeatherDataCity(
            name: 'Milan',
          ),
        );

        expect(actual, expected);
      });
    });
    group('getWeatherForecast', () {
      test('returns correct url', () {
        expect(
          WeatherApiClient.getIconUrl('04d'),
          'https://openweathermap.org/img/wn/04d@4x.png',
        );
      });
    });
  });
}
