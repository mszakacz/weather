// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage/local_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('LocalStorage', () {
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
    });

    LocalStorage createSubject() => LocalStorage(
          sharedPreferences: mockSharedPreferences,
        );

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          createSubject(),
          isNotNull,
        );
      });

      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });
  });
}
