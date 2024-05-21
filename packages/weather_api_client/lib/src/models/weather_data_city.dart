import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data_city.freezed.dart';
part 'weather_data_city.g.dart';

@freezed

/// WeatherDataCity
class WeatherDataCity with _$WeatherDataCity {
  /// WeatherDataCity const constructor
  const factory WeatherDataCity({
    required String name,
  }) = _WeatherDataCity;

  /// get WeatherDataCity instance from json
  factory WeatherDataCity.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataCityFromJson(json);
}
