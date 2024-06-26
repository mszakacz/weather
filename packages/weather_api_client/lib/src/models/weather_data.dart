import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_api_client/src/models/models.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed

/// WeatherData class autogenerated with Freezed
class WeatherData with _$WeatherData {
  /// WeatherData const factory
  const factory WeatherData({
    required int dt,
    required WeatherDataMain main,
    required List<WeatherDataWeather> weather,
    required WeatherDataWind wind,
  }) = _WeatherData;

  /// get WeatherData from json
  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}
