import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data_wind.freezed.dart';
part 'weather_data_wind.g.dart';

@freezed

/// WeatherDataWind
class WeatherDataWind with _$WeatherDataWind {
  /// WeatherDataWind
  const factory WeatherDataWind({
    required double speed,
    required int deg,
    required double gust,
  }) = _WeatherDataWind;

  /// get WeatherDataWind instance from json
  factory WeatherDataWind.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataWindFromJson(json);
}
