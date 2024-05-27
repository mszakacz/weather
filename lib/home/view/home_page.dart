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
    return Column(
      children: [
        const SizedBox(height: AppSpacing.s),

        // Location
        LocationWidget(
          city: state.weatherForecast.city,
        ),

        // Weather Details
        WeatherDetailsWidget(
          dayWeather: state.selectedDay,
        ),

        // Days
        DaysList(
          days: state.weatherForecast.days,
          selected: state.selectedDay,
        ),

        const SizedBox(height: AppSpacing.s),
      ],
    );
  }
}

@visibleForTesting
class LocationWidget extends StatelessWidget {
  const LocationWidget({
    required this.city,
    super.key,
  });

  final String city;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.place_outlined,
          color: AppColor.blue3,
        ),
        Text(
          city,
          style: TextStyles.h3blue,
        ),
      ],
    );
  }
}

@visibleForTesting
class DaysList extends StatelessWidget {
  const DaysList({
    required this.days,
    required this.selected,
    super.key,
  });

  final List<DayWeather> days;
  final DayWeather selected;

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
              isSelected: d == selected,
              onTap: (selected) {
                context.read<HomeBloc>().add(
                      SelectDay(dayWeather: selected),
                    );
              },
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
