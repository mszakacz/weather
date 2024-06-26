part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetWeatherForecast extends HomeEvent {
  const GetWeatherForecast();

  @override
  List<Object?> get props => [];
}

class SelectDay extends HomeEvent {
  const SelectDay({
    required this.dayWeather,
  });

  final DayWeather dayWeather;

  @override
  List<Object?> get props => [
        dayWeather,
      ];
}

class SwitchUnits extends HomeEvent {
  const SwitchUnits({
    required this.units,
  });

  final Units? units;

  @override
  List<Object?> get props => [
        units,
      ];
}
