// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherDataCity _$WeatherDataCityFromJson(Map<String, dynamic> json) {
  return _WeatherDataCity.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataCity {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataCityCopyWith<WeatherDataCity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCityCopyWith<$Res> {
  factory $WeatherDataCityCopyWith(
          WeatherDataCity value, $Res Function(WeatherDataCity) then) =
      _$WeatherDataCityCopyWithImpl<$Res, WeatherDataCity>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$WeatherDataCityCopyWithImpl<$Res, $Val extends WeatherDataCity>
    implements $WeatherDataCityCopyWith<$Res> {
  _$WeatherDataCityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDataCityImplCopyWith<$Res>
    implements $WeatherDataCityCopyWith<$Res> {
  factory _$$WeatherDataCityImplCopyWith(_$WeatherDataCityImpl value,
          $Res Function(_$WeatherDataCityImpl) then) =
      __$$WeatherDataCityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$WeatherDataCityImplCopyWithImpl<$Res>
    extends _$WeatherDataCityCopyWithImpl<$Res, _$WeatherDataCityImpl>
    implements _$$WeatherDataCityImplCopyWith<$Res> {
  __$$WeatherDataCityImplCopyWithImpl(
      _$WeatherDataCityImpl _value, $Res Function(_$WeatherDataCityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$WeatherDataCityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataCityImpl implements _WeatherDataCity {
  const _$WeatherDataCityImpl({required this.name});

  factory _$WeatherDataCityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataCityImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'WeatherDataCity(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataCityImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataCityImplCopyWith<_$WeatherDataCityImpl> get copyWith =>
      __$$WeatherDataCityImplCopyWithImpl<_$WeatherDataCityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataCityImplToJson(
      this,
    );
  }
}

abstract class _WeatherDataCity implements WeatherDataCity {
  const factory _WeatherDataCity({required final String name}) =
      _$WeatherDataCityImpl;

  factory _WeatherDataCity.fromJson(Map<String, dynamic> json) =
      _$WeatherDataCityImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDataCityImplCopyWith<_$WeatherDataCityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
