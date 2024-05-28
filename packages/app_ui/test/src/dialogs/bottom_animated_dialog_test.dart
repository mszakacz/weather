import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers/helpers.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('BottomAnimatedDialog', () {
    group('show', () {
      const key = Key('test_button_key');

      final content = Container();

      testWidgets('renders BottomAnimatedDialogWidget', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              return IconButton(
                key: key,
                icon: const Icon(Icons.settings_outlined),
                onPressed: () {
                  BottomAnimatedDialog.show(
                    context: context,
                    content: content,
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

  group('BottomAnimatedDialogWidget', () {
    const contentKey = Key('test_content_key');
    final content = Container(
      key: contentKey,
    );
    const title = 'title';
    Widget buildSubject() {
      return BottomAnimatedDialogWidget(
        content: content,
        title: title,
      );
    }

    testWidgets('renders DialogTitle with correct title', (tester) async {
      await tester.pumpApp(
        buildSubject(),
      );

      expect(find.byType(DialogTitle), findsOneWidget);
      final dialogTitle = tester.widget<DialogTitle>(
        find.byType(DialogTitle),
      );
      expect(dialogTitle.title, title);
    });

    testWidgets('renders content', (tester) async {
      await tester.pumpApp(
        buildSubject(),
      );

      expect(find.byKey(contentKey), findsOneWidget);
    });
  });

  group('DialogTitle', () {
    const title = 'title';
    Widget buildSubject() {
      return const DialogTitle(
        title: title,
      );
    }

    testWidgets('renders close icon button', (tester) async {
      await tester.pumpApp(
        buildSubject(),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('close dialog on icon tap', (tester) async {
      final navigator = MockNavigator();

      when(navigator.pop).thenAnswer((_) async {});
      when(navigator.canPop).thenReturn(true);

      await tester.pumpApp(
        buildSubject(),
        navigator: navigator,
      );
      final closeIconBtn = find.byKey(
        const Key('DialogTitle_CloseDialogIconButton'),
      );
      expect(closeIconBtn, findsOneWidget);
      await tester.pumpAndSettle();
      await tester.ensureVisible(closeIconBtn);

      await tester.tap(closeIconBtn);
      await tester.pumpAndSettle();

      verify(navigator.pop).called(1);
    });

    testWidgets('renders Text with correct title', (tester) async {
      await tester.pumpApp(
        buildSubject(),
      );

      expect(find.byType(Text), findsOneWidget);

      final textWidget = tester.widget<Text>(
        find.byType(Text),
      );
      expect(textWidget.data, title);
    });
  });
}
