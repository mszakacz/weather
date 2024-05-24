import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_api_client/location_api_client.dart';

/// Flutter package that handles location requests
class LocationApiClient {
  /// {@macro location_api_client}
  LocationApiClient({
    GeolocatorManager? geolocator,
  }) : _geolocator = geolocator ?? GeolocatorManager();

  final GeolocatorManager _geolocator;

  /// Get current location location coordinates
  Future<Position> getCurrentLocation() async {
    final permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final permission2 = await _geolocator.requestPermission();
      if (permission2 == LocationPermission.denied) {
        throw LocationPermissionDenied();
      }
    }
    try {
      final position = await _geolocator.getCurrentPosition();

      return position;
    } catch (_) {
      throw GetLocationFailure();
    }
  }
}

/// GeolocatorManager is a wrapper of Geolocator class.
/// it is created to enable testing of the LocationApiClient
/// by mocking GeolocatorManager
@visibleForTesting
class GeolocatorManager {
  /// Check permission
  Future<LocationPermission> checkPermission() async =>
      Geolocator.checkPermission();

  /// Request permission
  Future<LocationPermission> requestPermission() async =>
      Geolocator.requestPermission();

  /// Get current position
  Future<Position> getCurrentPosition() async =>
      Geolocator.getCurrentPosition();
}
