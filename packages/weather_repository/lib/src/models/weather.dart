import 'package:equatable/equatable.dart';
import 'package:weather_api_client/weather_api_client.dart';

/// Weather contains info about the temperature and weather condition in the day
class Weather extends Equatable {
  /// Weather const constructor
  const Weather({
    required this.time,
    required this.temperature,
    required this.iconUrl,
  });

  /// get Weather from WeatherData
  factory Weather.fromData(
    WeatherData data,
  ) =>
      Weather(
        time: DateTime.fromMillisecondsSinceEpoch(
          data.dt * 1000,
          isUtc: true,
        ).toLocal(),
        temperature: data.main.temp.round(),
        iconUrl: data.weather.first.icon,
      );

  /// date
  final DateTime time;

  /// temperature in Celsius
  final int temperature;

  /// url to the weather condition image (png)
  final String iconUrl;

  @override
  List<Object> get props => [
        time,
        temperature,
        iconUrl,
      ];
}
