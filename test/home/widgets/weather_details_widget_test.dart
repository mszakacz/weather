import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/home/home.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  group('WeatherDetailsParameters', () {
    final dayWeather = DayWeather(
      day: DateTime(2024, 5, 22),
      maxTemperature: 24,
      minTemperature: 20,
      iconUrl: 'url',
      condition: 'few clouds',
      humidity: 69,
      pressure: 1015,
      windGust: 2.3,
    );
    testWidgets('renders WeatherParameterItem 3 times', (tester) async {
      await tester.pumpApp(
        WeatherDetailsParameters(dayWeather: dayWeather),
      );
      expect(
        find.byType(WeatherParameterItem),
        findsNWidgets(3),
      );
    });
  });
  group('WeatherParameterItem', () {
    final dayWeather = DayWeather(
      day: DateTime(2024, 5, 22),
      maxTemperature: 24,
      minTemperature: 20,
      iconUrl: 'url',
      condition: 'few clouds',
      humidity: 69,
      pressure: 1015,
      windGust: 2.3,
    );
    testWidgets('renders humidity item correctly', (tester) async {
      await tester.pumpApp(
        WeatherParameterItem(
          label: 'humidity',
          value: dayWeather.humidity,
          icon: Icons.water_drop_outlined,
          units: '%',
        ),
      );

      expect(
        find.byType(Icon),
        findsOne,
      );

      final icon = tester.widget<Icon>(
        find.byType(Icon),
      );

      expect(icon.icon, Icons.water_drop_outlined);
    });
  });
}
