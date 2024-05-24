// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataWindImpl _$$WeatherDataWindImplFromJson(
  Map<String, dynamic> json,
) =>
    _$WeatherDataWindImpl(
      speed: (json['speed'] as num).toDouble(),
      deg: (json['deg'] as num).toInt(),
      gust: (json['gust'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeatherDataWindImplToJson(
  _$WeatherDataWindImpl instance,
) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
