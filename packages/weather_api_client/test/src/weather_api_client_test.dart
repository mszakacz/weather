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

    const lat = '30.05';
    const lon = '45.01';

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
                'lat': lat,
                'lon': lon,
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
          // TODO(Maciej): improve this test when WeatherForecast
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

      test('returns json on valid response', () async {
        // TODO(Maciej): improve this test when WeatherForecast model
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);

        when(() => response.body).thenReturn(
          '''
  {
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

        expect(
          actual,
          <String, dynamic>{},
        );
      });
    });
  });
}
