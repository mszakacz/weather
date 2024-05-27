import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:weather/l10n/l10n.dart';
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
            dayWeather.condition.capitalize(),
            style: TextStyles.h2,
          ),

          // Parameters: Humidity, Pressure and Wind
          WeatherDetailsParameters(dayWeather: dayWeather),
        ],
      ),
    );
  }
}

@visibleForTesting
class WeatherDetailsParameters extends StatelessWidget {
  const WeatherDetailsParameters({
    required this.dayWeather,
    super.key,
  });

  final DayWeather dayWeather;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.l,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s,
        vertical: AppSpacing.l,
      ),
      decoration: const BoxDecoration(
        color: AppColor.white2,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSpacing.l),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Wind Gust
          WeatherParameterItem(
            label: l10n.windGust,
            value: dayWeather.windGust,
            icon: Icons.air_outlined,
            units: 'm/s',
          ),

          // Humidity
          WeatherParameterItem(
            label: l10n.humidity,
            value: dayWeather.humidity,
            icon: Icons.water_drop_outlined,
            units: '%',
          ),

          // Humidity
          WeatherParameterItem(
            label: l10n.pressure,
            value: dayWeather.pressure,
            icon: Icons.mood_outlined,
            units: 'hPa',
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
class WeatherParameterItem extends StatelessWidget {
  const WeatherParameterItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.units,
    super.key,
  });

  final String label;
  final num value;
  final IconData icon;
  final String units;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon
        Icon(
          icon,
          size: 40,
          color: AppColor.blue3,
        ),

        // Value
        Text(
          '$value',
          style: TextStyles.h4,
        ),

        // Unit
        Text(
          units,
          style: TextStyles.h5,
        ),

        // Label
        Text(
          label,
          style: TextStyles.h5,
        ),
      ],
    );
  }
}
