// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDataImpl _$$LocationDataImplFromJson(Map<String, dynamic> json) =>
    _$LocationDataImpl(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationDataImplToJson(_$LocationDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
    };
