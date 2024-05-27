import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:weather_api_client/weather_api_client.dart';

import 'package:weather_repository/weather_repository.dart';

/// WeatherForecast present the current weather and weather forecast in the city
class WeatherForecast extends Equatable {
  /// WeatherForecast const constructor
  const WeatherForecast({
    required this.city,
    required this.moments,
  });

  /// create WeatherForecast instance from WeatherForecastData
  factory WeatherForecast.fromData(
    WeatherForecastData data,
  ) =>
      WeatherForecast(
        city: data.city.name,
        moments: data.list
            .map(
              Weather.fromData,
            )
            .toList(),
      );

  /// the city in for which weather forecast is presented
  final String city;

  /// the list of weather forecast for the next days
  final List<Weather> moments;

  @override
  List<Object> get props => [
        city,
        moments,
      ];

  /// get current weather
  Weather get current {
    final all = List<Weather>.from(moments)
      ..sort(
        (a, b) => a.time.compareTo(b.time),
      );
    return all.first;
  }

  /// get days weather
  List<DayWeather> get days {
    final now = moments
        .map((m) => m.time)
        .reduce((cur, next) => cur.isBefore(next) ? cur : next);
    final weekWeather = <DayWeather>[];
    for (var i = 0; i < 5; i++) {
      final day = now.copyWith(
        day: now.day + i,
      );
      final dayMoments = moments
          .where(
            (m) => m.time.day == day.day,
          )
          .toList();
      if (dayMoments.isEmpty) {
        return weekWeather;
      }
      final keyMoment = dayMoments.reduce(
        (cur, next) => cur.temperature > next.temperature ? cur : next,
      );
      weekWeather.add(
        DayWeather(
          day: day,
          maxTemperature: dayMoments.map((e) => e.temperature).reduce(max),
          minTemperature: dayMoments.map((e) => e.temperature).reduce(min),
          iconUrl: keyMoment.iconUrl,
          condition: keyMoment.condition,
          humidity: keyMoment.humidity,
          pressure: keyMoment.pressure,
          windGust: dayMoments.map((e) => e.windGust).reduce(max),
        ),
      );
    }
    return weekWeather;
  }

  /// get empty instance of the WeatherForecast class
  static const empty = WeatherForecast(
    city: '',
    moments: [],
  );
}
