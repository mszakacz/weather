import 'package:weather/app/app.dart';
import 'package:weather/bootstrap.dart';
// import 'package:weather_api_client/weather_api_client.dart';
// import 'package:weather_repository/weather_repository.dart';

void main() async {
  await bootstrap(
    () async {
      // final weatherApiClient = WeatherApiClient();
      // final weatherRepository = WeatherRepository(
      //   weatherApiClient: weatherApiClient,
      // );

      // final forecast = await weatherRepository.getWeatherForecast(
      //   lat: 53.13248860,
      //   lon: 23.16884030,
      // );

      return const App();
    },
  );
}
