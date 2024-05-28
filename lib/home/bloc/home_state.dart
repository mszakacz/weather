part of 'home_bloc.dart';

enum HomeStatus {
  loading,
  error,
  present,
}

@immutable
class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.weatherForecast,
    required this.selectedDay,
    required this.units,
  });

  final HomeStatus status;
  final WeatherForecast weatherForecast;
  final DayWeather selectedDay;
  final Units units;

  @override
  List<Object> get props => [
        status,
        weatherForecast,
        selectedDay,
        units,
      ];

  HomeState copyWith({
    HomeStatus? status,
    WeatherForecast? weatherForecast,
    DayWeather? selectedDay,
    Units? units,
  }) {
    return HomeState(
      status: status ?? this.status,
      weatherForecast: weatherForecast ?? this.weatherForecast,
      selectedDay: selectedDay ?? this.selectedDay,
      units: units ?? this.units,
    );
  }
}
