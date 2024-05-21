import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api_client/weather_api_client.dart';

/// Flutter package that handles weather API requests
class WeatherApiClient {
  /// {@macro weather_api_client}
  WeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'api.openweathermap.org';
  static const _method = '/data/2.5/forecast';

  // request to get the weather forecast by city string
  // https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=<api_key>

  // request to get weather forecast by lat lon
  // https://api.openweathermap.org/data/2.5/forecast?lat=30.44&lon=44.00&APPID=<api_key>

  // docs: https://openweathermap.org/forecast5

  /// get weather forecast by passing location latitude and longitude
  /// example of the request:
  /// https://api.openweathermap.org/data/2.5/forecast?lat=30.44&lon=44.00&APPID=<api_key>
  Future<WeatherForecastData> getWeatherForecast({
    required String lat,
    required String lon,
  }) async {
    final uri = Uri.https(
      _baseUrl,
      _method,
      {
        'lat': lat,
        'lon': lon,
        'APPID': const String.fromEnvironment('WEATHER_API_KEY'),
      },
    );

    final response = await _httpClient.get(
      uri,
    );

    if (response.statusCode != 200) {
      throw GetWeatherForecastFailure();
    }

    try {
      final dynamic json = jsonDecode(response.body);

      return WeatherForecastData.fromJson(json as Map<String, dynamic>);
    } catch (_) {
      throw WeatherForecastDeserializationFailure();
    }
  }
}
