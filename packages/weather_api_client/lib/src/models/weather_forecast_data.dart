import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_api_client/src/models/models.dart';

part 'weather_forecast_data.freezed.dart';
part 'weather_forecast_data.g.dart';

@freezed

/// WeatherForecastData
class WeatherForecastData with _$WeatherForecastData {
  /// WeatherForecastData const constructor
  const factory WeatherForecastData({
    required List<WeatherData> list,
    required WeatherDataCity city,
  }) = _WeatherForecastData;

  /// get WeatherForecastData instance from json
  factory WeatherForecastData.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDataFromJson(json);
}
