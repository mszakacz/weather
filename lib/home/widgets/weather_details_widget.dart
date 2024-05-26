import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    required this.dayWeather,
    super.key,
  });

  final DayWeather dayWeather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Day
          Text(
            dayWeather.day.longDate,
            style: TextStyles.h3white,
          ),

          // Icon
          CachedImg(
            imageUrl: dayWeather.iconUrl,
          ),

          // Temperature
          Text(
            '${dayWeather.maxTemperature.toStringAsFixed(0)}°',
            style: TextStyles.h1,
          ),

          // Weather Condition Description
          Text(
            dayWeather.description.capitalize(),
            style: TextStyles.h2,
          ),
        ],
      ),
    );
  }
}
