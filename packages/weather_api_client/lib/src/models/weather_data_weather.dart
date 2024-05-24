import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data_weather.freezed.dart';
part 'weather_data_weather.g.dart';

@freezed

/// WeatherData.weather
class WeatherDataWeather with _$WeatherDataWeather {
  /// WeatherDataWeather const constructor
  const factory WeatherDataWeather({
    required String icon,
    required String description,
  }) = _WeatherDataWeather;

  /// get WeatherDataWeather instance from json
  factory WeatherDataWeather.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataWeatherFromJson(json);
}
