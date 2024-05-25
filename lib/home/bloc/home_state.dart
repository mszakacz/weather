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
  });

  final HomeStatus status;
  final WeatherForecast weatherForecast;
  final DayWeather selectedDay;

  @override
  List<Object> get props => [
        status,
        weatherForecast,
        selectedDay,
      ];

  HomeState copyWith({
    HomeStatus? status,
    WeatherForecast? weatherForecast,
    DayWeather? selectedDay,
  }) {
    return HomeState(
      status: status ?? this.status,
      weatherForecast: weatherForecast ?? this.weatherForecast,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}
