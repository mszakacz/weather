import 'package:weather/app/app.dart';
import 'package:weather/bootstrap.dart';

void main() async {
  await bootstrap(
    () async {
      return const App();
    },
  );
}
