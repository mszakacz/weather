import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.freezed.dart';
part 'location_data.g.dart';

@freezed

/// LocationData stores the info about place name and coordinates
class LocationData with _$LocationData {
  /// LocationData
  const factory LocationData({
    required String name,
    required String country,
    required double lat,
    required double lon,
  }) = _LocationData;

  /// get LocationData instance from json
  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}
