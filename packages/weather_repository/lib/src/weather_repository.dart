import 'package:flutter/foundation.dart';
import 'package:local_storage/local_storage.dart';
import 'package:location_api_client/location_api_client.dart';
import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

/// Flutter package that handles Weather related requests
class WeatherRepository {
  /// {@macro weather_repository}
  const WeatherRepository({
    required WeatherApiClient weatherApiClient,
    required LocationApiClient locationApiClient,
    required LocalStorage localStorage,
  })  : _weatherApiClient = weatherApiClient,
        _locationApiClient = locationApiClient,
        _localStorage = localStorage;

  final WeatherApiClient _weatherApiClient;
  final LocationApiClient _locationApiClient;
  final LocalStorage _localStorage;

  static const _unitsKey = 'units';

  /// Get weather forecast
  @visibleForTesting
  Future<WeatherForecast> getWeatherForecast({
    required double lat,
    required double lon,
  }) async {
    final units = getUnits();
    final data = await _weatherApiClient.getWeatherForecast(
      lat: lat,
      lon: lon,
      units: units.name,
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

  /// Save weather units
  Future<void> saveUnits(Units units) async {
    await _localStorage.save(units.name, _unitsKey);
  }

  /// Get Weather units
  Units getUnits() {
    final data = _localStorage.get(_unitsKey);
    if (data == null) {
      return Units.metric;
    } else {
      return Units.values.firstWhere((u) => u.name == data);
    }
  }
}
