// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherDataWeather _$WeatherDataWeatherFromJson(Map<String, dynamic> json) {
  return _WeatherDataWeather.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataWeather {
  String get icon => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataWeatherCopyWith<WeatherDataWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataWeatherCopyWith<$Res> {
  factory $WeatherDataWeatherCopyWith(
          WeatherDataWeather value, $Res Function(WeatherDataWeather) then) =
      _$WeatherDataWeatherCopyWithImpl<$Res, WeatherDataWeather>;
  @useResult
  $Res call({String icon, String description});
}

/// @nodoc
class _$WeatherDataWeatherCopyWithImpl<$Res, $Val extends WeatherDataWeather>
    implements $WeatherDataWeatherCopyWith<$Res> {
  _$WeatherDataWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDataWeatherImplCopyWith<$Res>
    implements $WeatherDataWeatherCopyWith<$Res> {
  factory _$$WeatherDataWeatherImplCopyWith(_$WeatherDataWeatherImpl value,
          $Res Function(_$WeatherDataWeatherImpl) then) =
      __$$WeatherDataWeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String icon, String description});
}

/// @nodoc
class __$$WeatherDataWeatherImplCopyWithImpl<$Res>
    extends _$WeatherDataWeatherCopyWithImpl<$Res, _$WeatherDataWeatherImpl>
    implements _$$WeatherDataWeatherImplCopyWith<$Res> {
  __$$WeatherDataWeatherImplCopyWithImpl(_$WeatherDataWeatherImpl _value,
      $Res Function(_$WeatherDataWeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? description = null,
  }) {
    return _then(_$WeatherDataWeatherImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataWeatherImpl implements _WeatherDataWeather {
  const _$WeatherDataWeatherImpl(
      {required this.icon, required this.description});

  factory _$WeatherDataWeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataWeatherImplFromJson(json);

  @override
  final String icon;
  @override
  final String description;

  @override
  String toString() {
    return 'WeatherDataWeather(icon: $icon, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataWeatherImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, icon, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataWeatherImplCopyWith<_$WeatherDataWeatherImpl> get copyWith =>
      __$$WeatherDataWeatherImplCopyWithImpl<_$WeatherDataWeatherImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataWeatherImplToJson(
      this,
    );
  }
}

abstract class _WeatherDataWeather implements WeatherDataWeather {
  const factory _WeatherDataWeather(
      {required final String icon,
      required final String description}) = _$WeatherDataWeatherImpl;

  factory _WeatherDataWeather.fromJson(Map<String, dynamic> json) =
      _$WeatherDataWeatherImpl.fromJson;

  @override
  String get icon;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDataWeatherImplCopyWith<_$WeatherDataWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
