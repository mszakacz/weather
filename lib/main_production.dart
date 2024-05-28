import 'package:flutter/material.dart';
import 'package:local_storage/local_storage.dart';
import 'package:location_api_client/location_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/app.dart';
import 'package:weather/bootstrap.dart';
import 'package:weather_api_client/weather_api_client.dart';
import 'package:weather_repository/weather_repository.dart';

void main() async {
  await bootstrap(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final sharedPreferences = await SharedPreferences.getInstance();

      final weatherApiClient = WeatherApiClient();
      final locationApiClient = LocationApiClient();
      final localStorage = LocalStorage(
        sharedPreferences: sharedPreferences,
      );
      final weatherRepository = WeatherRepository(
        weatherApiClient: weatherApiClient,
        locationApiClient: locationApiClient,
        localStorage: localStorage,
      );

      return App(
        weatherRepository: weatherRepository,
      );
    },
  );
}
