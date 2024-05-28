import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/home/home.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  group('SettingsDialog', () {
    group('show', () {
      const key = Key('test_button_key');

      testWidgets('renders SettingsDialogContent', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              return IconButton(
                key: key,
                icon: const Icon(Icons.settings_outlined),
                onPressed: () {
                  SettingsDialog.show(
                    context: context,
                    onChange: (_) {},
                    selected: Units.metric,
                  );
                },
              );
            },
          ),
        );

        expect(find.byKey(key), findsOneWidget);
        final testButton = find.byKey(key);

        await tester.pumpAndSettle();

        await tester.ensureVisible(testButton);
        await tester.tap(testButton);
        await tester.pumpAndSettle();

        expect(find.byType(SettingsDialogContent), findsOneWidget);
      });

      testWidgets('shows BottomAnimatedDialog', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              return IconButton(
                key: key,
                icon: const Icon(Icons.settings_outlined),
                onPressed: () {
                  SettingsDialog.show(
                    context: context,
                    onChange: (_) {},
                    selected: Units.metric,
                  );
                },
              );
            },
          ),
        );

        expect(find.byKey(key), findsOneWidget);
        final testButton = find.byKey(key);

        await tester.pumpAndSettle();

        await tester.ensureVisible(testButton);
        await tester.tap(testButton);
        await tester.pumpAndSettle();

        expect(find.byType(BottomAnimatedDialogWidget), findsOneWidget);
      });
    });
  });

  group('SettingsDialogContent', () {
    const selected = Units.metric;
    Widget buildSubject() {
      return SettingsDialogContent(
        onChange: (_) {},
        selected: selected,
      );
    }

    testWidgets('renders RadioList with correct selection', (tester) async {
      await tester.pumpApp(buildSubject());

      expect(
        find.byKey(
          const Key('SettingsDialog_Content_RadioList'),
        ),
        findsOneWidget,
      );

      final radioList = tester.widget<RadioList<Units>>(
        find.byKey(
          const Key('SettingsDialog_Content_RadioList'),
        ),
      );

      expect(radioList.selected, selected);
    });
  });
}
