import 'package:flutter_test/flutter_test.dart';

import 'package:weather/home/bloc/home_bloc.dart';

void main() {
  group('HomeEvent', () {
    group('GetWeatherForecast', () {
      test('supports value equality', () {
        expect(
          const GetWeatherForecast(),
          equals(const GetWeatherForecast()),
        );
      });
    });
  });
}
