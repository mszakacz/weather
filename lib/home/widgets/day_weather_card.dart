import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_repository/weather_repository.dart';

class DayWeatherCard extends StatelessWidget {
  const DayWeatherCard({
    required this.dayWeather,
    required this.onTap,
    super.key,
  });

  final DayWeather dayWeather;
  final void Function(DayWeather) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(dayWeather),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.l),
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
        ),
        decoration: const BoxDecoration(
          color: AppColor.lightBlue3,
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.l),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Day
            Text(
              dayWeather.day.dayNameShort,
              style: TextStyles.h3white,
            ),

            // Icon
            CachedImg(
              imageUrl: dayWeather.iconUrl,
              height: 55,
            ),

            // Max Temperature
            Text(
              '${dayWeather.maxTemperature.toStringAsFixed(0)}°',
              style: TextStyles.h3white,
            ),

            // Min Temperature
            Text(
              '${dayWeather.minTemperature.toStringAsFixed(0)}°',
              style: TextStyles.h3blue,
            ),
          ],
        ),
      ),
    );
  }
}
