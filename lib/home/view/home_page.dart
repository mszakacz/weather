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
        body: HomeView(),
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
            return const PresentView();
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
  const PresentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      // TODO(Maciej): develop PresentView
      child: Text('Weather'),
    );
  }
}
