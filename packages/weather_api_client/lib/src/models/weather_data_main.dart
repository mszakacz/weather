import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data_main.freezed.dart';
part 'weather_data_main.g.dart';

@freezed

/// WeatherDataMain class
class WeatherDataMain with _$WeatherDataMain {
  /// WeatherDataMain const constructor
  const factory WeatherDataMain({
    required double temp,
  }) = _WeatherDataMain;

  /// get WeatherDataMain instance from json
  factory WeatherDataMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataMainFromJson(json);
}
