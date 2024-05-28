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

    group('save', () {
      test('calls setString on sharedPreferences', () async {
        const value = 'v';
        const key = 'k';
        when(
          () => mockSharedPreferences.setString(key, value),
        ).thenAnswer((_) async => true);
        await createSubject().save(value, key);
        verify(
          () => mockSharedPreferences.setString(key, value),
        ).called(1);
      });
    });

    group('get', () {
      const value = 'v';
      const key = 'k';

      test('calls getString on sharedPreferences', () async {
        when(
          () => mockSharedPreferences.getString(key),
        ).thenAnswer((_) => value);

        createSubject().get(key);
        verify(
          () => mockSharedPreferences.getString(key),
        ).called(1);
      });

      test('returns correct String from database', () async {
        when(
          () => mockSharedPreferences.getString(key),
        ).thenAnswer((_) => value);

        final response = createSubject().get(key);
        expect(response, value);
      });
    });
  });
}
