import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('RadioList', () {
    testWidgets('renders RadioListItem n-times', (tester) async {
      await tester.pumpApp(
        RadioList<String>(
          values: const ['1', '2'],
          selected: '1',
          onChange: (_) {},
          textBuilder: (item) => item,
        ),
      );
      expect(
        find.byType(RadioListItem<String>),
        findsNWidgets(2),
      );
    });
  });

  group('RadioListItem', () {
    testWidgets('renders RadioListTile with correct text', (tester) async {
      const text = '2';
      await tester.pumpApp(
        RadioListItem<String>(
          value: text,
          selected: '1',
          onChange: (_) {},
          text: text,
        ),
      );
      expect(
        find.byType(RadioListTile<String>),
        findsOne,
      );

      final textWidget = tester.widget<Text>(
        find.byType(Text),
      );
      expect(textWidget.data, text);
    });
  });
}
