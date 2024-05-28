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
  static const _forecastMethod = '/data/2.5/forecast';
  static const _geoMethod = '/geo/1.0/direct';

  /// get weather forecast by passing location latitude and longitude
  /// example of the request:
  /// https://api.openweathermap.org/data/2.5/forecast?lat=30.44&lon=44.00&APPID=<api_key>
  Future<WeatherForecastData> getWeatherForecast({
    required double lat,
    required double lon,
    required String units,
  }) async {
    final params = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'units': units,
      'APPID': const String.fromEnvironment('WEATHER_API_KEY'),
    };
    final uri = Uri.https(
      _baseUrl,
      _forecastMethod,
      params,
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

  /// Get icon url
  /// possible size is 1, 2, 4
  static String getIconUrl(
    String icon, {
    int size = 4,
  }) {
    return 'https://openweathermap.org/img/wn/$icon@${size}x.png';
  }

  /// Get locations by query
  Future<List<LocationData>> getLocations({
    required String query,
    int limit = 3,
  }) async {
    final uri = Uri.https(
      _baseUrl,
      _geoMethod,
      {
        'q': query,
        'limit': '$limit',
        'APPID': const String.fromEnvironment('WEATHER_API_KEY'),
      },
    );

    final response = await _httpClient.get(
      uri,
    );

    if (response.statusCode != 200) {
      throw GetLocationsFailure();
    }

    try {
      final list = jsonDecode(response.body);

      final locations = <LocationData>[];
      for (final json in list as List) {
        locations.add(
          LocationData.fromJson(json as Map<String, dynamic>),
        );
      }

      return locations;
    } catch (_) {
      throw LocationDataDeserializationFailure();
    }
  }
}
