import 'package:equatable/equatable.dart';

/// DayWeather contains the info about the weather in specific day
class DayWeather extends Equatable {
  /// DayWeather const constructor
  const DayWeather({
    required this.day,
    required this.maxTemperature,
    required this.minTemperature,
    required this.iconUrl,
    required this.condition,
    required this.humidity,
    required this.pressure,
    required this.windGust,
  });

  /// Day
  final DateTime day;

  /// Max temperature
  final int maxTemperature;

  /// Min temperature
  final int minTemperature;

  /// Icon url
  final String iconUrl;

  /// Weather condition description
  final String condition;

  /// Humidity
  final int humidity;

  /// Pressure
  final int pressure;

  /// Wind gust
  final double windGust;

  @override
  List<Object> get props => [
        day,
        maxTemperature,
        minTemperature,
        iconUrl,
        condition,
        humidity,
        pressure,
        windGust,
      ];

  /// get empty instance of the DayWeather
  static final empty = DayWeather(
    day: DateTime(2024),
    maxTemperature: 20,
    minTemperature: 16,
    iconUrl: '',
    condition: '',
    humidity: 0,
    pressure: 0,
    windGust: 0,
  );
}
