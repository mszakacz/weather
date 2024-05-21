import 'package:weather/app/app.dart';
import 'package:weather/bootstrap.dart';
import 'package:weather_api_client/weather_api_client.dart';

void main() async {
  await bootstrap(
    () async {
      final weatherApiClient = WeatherApiClient();

      final locations = await weatherApiClient.getLocations(
        query: 'Warsaw',
      );
      return const App();
    },
  );
}
