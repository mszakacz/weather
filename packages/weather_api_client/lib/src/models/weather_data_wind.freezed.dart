// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_wind.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherDataWind _$WeatherDataWindFromJson(Map<String, dynamic> json) {
  return _WeatherDataWind.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataWind {
  double get speed => throw _privateConstructorUsedError;
  int get deg => throw _privateConstructorUsedError;
  double get gust => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataWindCopyWith<WeatherDataWind> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataWindCopyWith<$Res> {
  factory $WeatherDataWindCopyWith(
          WeatherDataWind value, $Res Function(WeatherDataWind) then) =
      _$WeatherDataWindCopyWithImpl<$Res, WeatherDataWind>;
  @useResult
  $Res call({double speed, int deg, double gust});
}

/// @nodoc
class _$WeatherDataWindCopyWithImpl<$Res, $Val extends WeatherDataWind>
    implements $WeatherDataWindCopyWith<$Res> {
  _$WeatherDataWindCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? deg = null,
    Object? gust = null,
  }) {
    return _then(_value.copyWith(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      deg: null == deg
          ? _value.deg
          : deg // ignore: cast_nullable_to_non_nullable
              as int,
      gust: null == gust
          ? _value.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDataWindImplCopyWith<$Res>
    implements $WeatherDataWindCopyWith<$Res> {
  factory _$$WeatherDataWindImplCopyWith(_$WeatherDataWindImpl value,
          $Res Function(_$WeatherDataWindImpl) then) =
      __$$WeatherDataWindImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double speed, int deg, double gust});
}

/// @nodoc
class __$$WeatherDataWindImplCopyWithImpl<$Res>
    extends _$WeatherDataWindCopyWithImpl<$Res, _$WeatherDataWindImpl>
    implements _$$WeatherDataWindImplCopyWith<$Res> {
  __$$WeatherDataWindImplCopyWithImpl(
      _$WeatherDataWindImpl _value, $Res Function(_$WeatherDataWindImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? deg = null,
    Object? gust = null,
  }) {
    return _then(_$WeatherDataWindImpl(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      deg: null == deg
          ? _value.deg
          : deg // ignore: cast_nullable_to_non_nullable
              as int,
      gust: null == gust
          ? _value.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataWindImpl implements _WeatherDataWind {
  const _$WeatherDataWindImpl(
      {required this.speed, required this.deg, required this.gust});

  factory _$WeatherDataWindImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataWindImplFromJson(json);

  @override
  final double speed;
  @override
  final int deg;
  @override
  final double gust;

  @override
  String toString() {
    return 'WeatherDataWind(speed: $speed, deg: $deg, gust: $gust)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataWindImpl &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.deg, deg) || other.deg == deg) &&
            (identical(other.gust, gust) || other.gust == gust));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, speed, deg, gust);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataWindImplCopyWith<_$WeatherDataWindImpl> get copyWith =>
      __$$WeatherDataWindImplCopyWithImpl<_$WeatherDataWindImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataWindImplToJson(
      this,
    );
  }
}

abstract class _WeatherDataWind implements WeatherDataWind {
  const factory _WeatherDataWind(
      {required final double speed,
      required final int deg,
      required final double gust}) = _$WeatherDataWindImpl;

  factory _WeatherDataWind.fromJson(Map<String, dynamic> json) =
      _$WeatherDataWindImpl.fromJson;

  @override
  double get speed;
  @override
  int get deg;
  @override
  double get gust;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDataWindImplCopyWith<_$WeatherDataWindImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
