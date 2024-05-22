import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

/// Flutter package that handles Weather related requests
class WeatherRepository {
  /// {@macro weather_repository}
  const WeatherRepository({
    required WeatherApiClient weatherApiClient,
  }) : _weatherApiClient = weatherApiClient;

  final WeatherApiClient _weatherApiClient;

  /// Get weather forecast
  Future<WeatherForecast> getWeatherForecast({
    required double lat,
    required double lon,
  }) async {
    final data = await _weatherApiClient.getWeatherForecast(
      lat: lat,
      lon: lon,
    );

    return WeatherForecast.fromData(data);
  }
}
