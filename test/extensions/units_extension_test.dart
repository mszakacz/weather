import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/extensions/extensions.dart';
import 'package:weather_repository/weather_repository.dart';

import '../helpers/helpers.dart';

void main() {
  group('UnitsExtension', () {
    group('description', () {
      testWidgets('returns metric description', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              expect(
                Units.metric.description(context),
                'Metric (Celsius)',
              );

              return const Placeholder();
            },
          ),
        );
      });

      testWidgets('returns imperial description', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              expect(
                Units.imperial.description(context),
                'Imperial (Fahrenheit)',
              );

              return const Placeholder();
            },
          ),
        );
      });
    });

    group('speedUnit', () {
      test('returns metric unit', () {
        expect(Units.metric.speedUnit(), 'm/s');
      });
      test('returns imperial unit', () {
        expect(Units.imperial.speedUnit(), 'mph');
      });
    });
  });
}
