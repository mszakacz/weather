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
            units: weatherRepository.getUnits(),
          ),
        ) {
    on<GetWeatherForecast>(_onGetWeatherForecast);
    on<SelectDay>(_onSelectDay);
    on<SwitchUnits>(_onSwitchUnits);
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

  Future<void> _onSwitchUnits(
    SwitchUnits event,
    Emitter<HomeState> emit,
  ) async {
    final units = event.units;
    if (units != null) {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
        ),
      );

      try {
        await _weatherRepository.saveUnits(units);
        emit(
          state.copyWith(
            units: units,
          ),
        );
        add(
          const GetWeatherForecast(),
        );
      } catch (_) {
        emit(
          state.copyWith(
            status: HomeStatus.error,
          ),
        );
      }
    }
  }
}
