import 'package:flutter/foundation.dart';
import 'package:location_api_client/location_api_client.dart';
import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

/// Flutter package that handles Weather related requests
class WeatherRepository {
  /// {@macro weather_repository}
  const WeatherRepository({
    required WeatherApiClient weatherApiClient,
    required LocationApiClient locationApiClient,
  })  : _weatherApiClient = weatherApiClient,
        _locationApiClient = locationApiClient;

  final WeatherApiClient _weatherApiClient;
  final LocationApiClient _locationApiClient;

  /// Get weather forecast
  @visibleForTesting
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

  /// Get the weather forecast for the location of the device
  Future<WeatherForecast> getWeatherForDeviceLocation() async {
    final location = await _locationApiClient.getCurrentLocation();

    final weatherForecast = await getWeatherForecast(
      lat: location.latitude,
      lon: location.longitude,
    );

    return weatherForecast;
  }
}
