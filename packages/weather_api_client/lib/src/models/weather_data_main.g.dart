// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataMainImpl _$$WeatherDataMainImplFromJson(
  Map<String, dynamic> json,
) =>
    _$WeatherDataMainImpl(
      temp: (json['temp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      pressure: (json['pressure'] as num).toInt(),
    );

Map<String, dynamic> _$$WeatherDataMainImplToJson(
  _$WeatherDataMainImpl instance,
) =>
    <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
    };
