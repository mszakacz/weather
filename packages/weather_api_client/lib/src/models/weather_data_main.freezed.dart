// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherDataMain _$WeatherDataMainFromJson(Map<String, dynamic> json) {
  return _WeatherDataMain.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataMain {
  double get temp => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  int get pressure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataMainCopyWith<WeatherDataMain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataMainCopyWith<$Res> {
  factory $WeatherDataMainCopyWith(
          WeatherDataMain value, $Res Function(WeatherDataMain) then) =
      _$WeatherDataMainCopyWithImpl<$Res, WeatherDataMain>;
  @useResult
  $Res call({double temp, int humidity, int pressure});
}

/// @nodoc
class _$WeatherDataMainCopyWithImpl<$Res, $Val extends WeatherDataMain>
    implements $WeatherDataMainCopyWith<$Res> {
  _$WeatherDataMainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
    Object? pressure = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDataMainImplCopyWith<$Res>
    implements $WeatherDataMainCopyWith<$Res> {
  factory _$$WeatherDataMainImplCopyWith(_$WeatherDataMainImpl value,
          $Res Function(_$WeatherDataMainImpl) then) =
      __$$WeatherDataMainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double temp, int humidity, int pressure});
}

/// @nodoc
class __$$WeatherDataMainImplCopyWithImpl<$Res>
    extends _$WeatherDataMainCopyWithImpl<$Res, _$WeatherDataMainImpl>
    implements _$$WeatherDataMainImplCopyWith<$Res> {
  __$$WeatherDataMainImplCopyWithImpl(
      _$WeatherDataMainImpl _value, $Res Function(_$WeatherDataMainImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
    Object? pressure = null,
  }) {
    return _then(_$WeatherDataMainImpl(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataMainImpl implements _WeatherDataMain {
  const _$WeatherDataMainImpl(
      {required this.temp, required this.humidity, required this.pressure});

  factory _$WeatherDataMainImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataMainImplFromJson(json);

  @override
  final double temp;
  @override
  final int humidity;
  @override
  final int pressure;

  @override
  String toString() {
    return 'WeatherDataMain(temp: $temp, humidity: $humidity, pressure: $pressure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataMainImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, temp, humidity, pressure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataMainImplCopyWith<_$WeatherDataMainImpl> get copyWith =>
      __$$WeatherDataMainImplCopyWithImpl<_$WeatherDataMainImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataMainImplToJson(
      this,
    );
  }
}

abstract class _WeatherDataMain implements WeatherDataMain {
  const factory _WeatherDataMain(
      {required final double temp,
      required final int humidity,
      required final int pressure}) = _$WeatherDataMainImpl;

  factory _WeatherDataMain.fromJson(Map<String, dynamic> json) =
      _$WeatherDataMainImpl.fromJson;

  @override
  double get temp;
  @override
  int get humidity;
  @override
  int get pressure;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDataMainImplCopyWith<_$WeatherDataMainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
