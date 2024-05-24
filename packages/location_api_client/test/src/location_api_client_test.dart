import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_api_client/location_api_client.dart';
import 'package:mocktail/mocktail.dart';

class MockGeolocatorManager extends Mock implements GeolocatorManager {}

void main() {
  group('LocationApiClient', () {
    late MockGeolocatorManager mockGeolocatorManager;
    late LocationApiClient apiClient;

    final position = Position(
      longitude: -122.08395287867832,
      latitude: 37.42342342342342,
      timestamp: DateTime.now(),
      accuracy: 2000,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 1,
      speed: 0,
      speedAccuracy: 0,
    );

    setUp(() {
      mockGeolocatorManager = MockGeolocatorManager();
      apiClient = LocationApiClient(geolocator: mockGeolocatorManager);
    });

    LocationApiClient createSubject() => LocationApiClient(
          geolocator: mockGeolocatorManager,
        );

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          LocationApiClient(geolocator: mockGeolocatorManager),
          isNotNull,
        );
      });
      test('does not require geolocator', () {
        expect(
          LocationApiClient(),
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

    group('getCurrentLocation', () {
      test('checks permission', () async {
        when(() => mockGeolocatorManager.checkPermission()).thenAnswer(
          (_) async => LocationPermission.always,
        );
        when(() => mockGeolocatorManager.requestPermission()).thenAnswer(
          (_) async => LocationPermission.always,
        );
        when(() => mockGeolocatorManager.getCurrentPosition()).thenAnswer(
          (_) async => position,
        );
        await apiClient.getCurrentLocation();
        verify(() => mockGeolocatorManager.checkPermission()).called(1);
      });

      test('does not requests permission when already given', () async {
        when(() => mockGeolocatorManager.checkPermission()).thenAnswer(
          (_) async => LocationPermission.always,
        );
        when(() => mockGeolocatorManager.requestPermission()).thenAnswer(
          (_) async => LocationPermission.always,
        );
        when(() => mockGeolocatorManager.getCurrentPosition()).thenAnswer(
          (_) async => position,
        );
        await apiClient.getCurrentLocation();
        verifyNever(() => mockGeolocatorManager.requestPermission());
      });

      test('requests permission when needed', () async {
        when(() => mockGeolocatorManager.checkPermission()).thenAnswer(
          (_) async => LocationPermission.denied,
        );
        when(() => mockGeolocatorManager.requestPermission()).thenAnswer(
          (_) async => LocationPermission.always,
        );
        when(() => mockGeolocatorManager.getCurrentPosition()).thenAnswer(
          (_) async => position,
        );
        await apiClient.getCurrentLocation();
        verify(() => mockGeolocatorManager.requestPermission()).called(1);
      });

      test('throws LocationPermissionDenied', () async {
        when(() => mockGeolocatorManager.checkPermission()).thenAnswer(
          (_) async => LocationPermission.denied,
        );
        when(() => mockGeolocatorManager.requestPermission()).thenAnswer(
          (_) async => LocationPermission.denied,
        );
        expect(
          () async => apiClient.getCurrentLocation(),
          throwsA(isA<LocationPermissionDenied>()),
        );
      });

      test('throws GetLocationFailure', () async {
        when(() => mockGeolocatorManager.checkPermission()).thenAnswer(
          (_) async => LocationPermission.always,
        );
        when(() => mockGeolocatorManager.getCurrentPosition()).thenThrow(
          (_) async => Exception(),
        );

        expect(
          () async => apiClient.getCurrentLocation(),
          throwsA(isA<GetLocationFailure>()),
        );
      });

      test('returns Position', () async {
        when(() => mockGeolocatorManager.checkPermission()).thenAnswer(
          (_) async => LocationPermission.always,
        );

        when(() => mockGeolocatorManager.getCurrentPosition()).thenAnswer(
          (_) async => position,
        );

        final actual = await apiClient.getCurrentLocation();
        expect(
          actual,
          equals(position),
        );
      });
    });
  });
}
