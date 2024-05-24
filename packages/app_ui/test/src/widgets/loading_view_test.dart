import 'package:app_ui/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('LoadingView', () {
    testWidgets('renders LoadingAnimationWidget', (tester) async {
      await tester.pumpApp(
        const LoadingView(),
      );
      expect(
        find.byKey(
          const Key('LoadingView'),
        ),
        findsOne,
      );
    });
  });
}
