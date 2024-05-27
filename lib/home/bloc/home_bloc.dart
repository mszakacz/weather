import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_repository/weather_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(
          HomeState(
            status: HomeStatus.loading,
            weatherForecast: WeatherForecast.empty,
            selectedDay: DayWeather.empty,
          ),
        ) {
    on<GetWeatherForecast>(_onGetWeatherForecast);
    on<SelectDay>(_onSelectDay);
  }

  final WeatherRepository _weatherRepository;

  Future<void> _onGetWeatherForecast(
    GetWeatherForecast event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );

    try {
      final weatherForecast =
          await _weatherRepository.getWeatherForDeviceLocation();
      emit(
        state.copyWith(
          status: HomeStatus.present,
          weatherForecast: weatherForecast,
          selectedDay: weatherForecast.days.first,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
        ),
      );
    }
  }

  void _onSelectDay(
    SelectDay event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        selectedDay: event.dayWeather,
      ),
    );
  }
}
