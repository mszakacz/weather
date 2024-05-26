import 'package:equatable/equatable.dart';

/// DayWeather contains the info about the weather in specific day
class DayWeather extends Equatable {
  /// DayWeather const constructor
  const DayWeather({
    required this.day,
    required this.maxTemperature,
    required this.minTemperature,
    required this.iconUrl,
    required this.description,
  });

  /// Day
  final DateTime day;

  /// Max temperature
  final int maxTemperature;

  /// Min temperature
  final int minTemperature;

  /// Icon url
  final String iconUrl;

  /// Weather conditions description
  final String description;

  @override
  List<Object> get props => [
        day,
        maxTemperature,
        minTemperature,
        iconUrl,
        description,
      ];

  /// get empty instance of the DayWeather
  static final empty = DayWeather(
    day: DateTime(2024),
    maxTemperature: 20,
    minTemperature: 16,
    iconUrl: '',
    description: '',
  );
}
