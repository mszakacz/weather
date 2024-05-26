import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/home/home.dart';
import 'package:weather_repository/weather_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        weatherRepository: context.read<WeatherRepository>(),
      )..add(
          const GetWeatherForecast(),
        ),
      child: const Scaffold(
        body: SafeArea(
          child: HomeView(),
        ),
      ),
    );
  }
}

@visibleForTesting
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.loading:
            return const LoadingView();

          case HomeStatus.error:
            return const ErrorView();

          case HomeStatus.present:
            return PresentView(
              state: state,
            );
        }
      },
    );
  }
}

@visibleForTesting
class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      // TODO(Maciej): develop ErrorView text
      child: Text('Error'),
    );
  }
}

@visibleForTesting
class PresentView extends StatelessWidget {
  const PresentView({
    required this.state,
    super.key,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DaysList(
        days: state.weatherForecast.days,
      ),
    );
  }
}

@visibleForTesting
class DaysList extends StatelessWidget {
  const DaysList({
    required this.days,
    super.key,
  });

  final List<DayWeather> days;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...[
            const SizedBox(
              width: AppSpacing.m,
            ),
          ],
          ...days.map(
            (d) => DayWeatherCard(
              dayWeather: d,
            ),
          ),
          ...[
            const SizedBox(
              width: AppSpacing.m,
            ),
          ],
        ],
      ),
    );
  }
}
