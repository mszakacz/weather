import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/app/app.dart';
import 'package:weather/home/view/home_page.dart';
import 'package:weather_repository/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('App', () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        App(
          weatherRepository: weatherRepository,
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
