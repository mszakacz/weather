import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('CachedImg', () {
    const imageUrl = 'https://openweathermap.org/img/wn/03d@4x.png';

    testWidgets('renders CachedNetworkImage', (tester) async {
      await tester.pumpApp(
        const CachedImg(
          imageUrl: imageUrl,
        ),
      );
      expect(
        find.byType(CachedNetworkImage),
        findsOne,
      );
    });
  });
}
