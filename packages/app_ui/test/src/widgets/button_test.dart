import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('Button', () {
    const text = 'Retry';
    testWidgets('renders ElevatedButton with proper text', (tester) async {
      await tester.pumpApp(
        Button(
          text: text,
          onTap: () {},
        ),
      );
      expect(
        find.byType(ElevatedButton),
        findsOne,
      );

      expect(
        find.byType(Text),
        findsOne,
      );

      final textWidget = tester.widget<Text>(
        find.byType(Text),
      );

      expect(textWidget.data, text);
    });
  });
}
