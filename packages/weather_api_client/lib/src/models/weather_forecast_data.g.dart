// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherForecastDataImpl _$$WeatherForecastDataImplFromJson(
  Map<String, dynamic> json,
) =>
    _$WeatherForecastDataImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: WeatherDataCity.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherForecastDataImplToJson(
  _$WeatherForecastDataImpl instance,
) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };
