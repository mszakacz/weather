// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherForecastData _$WeatherForecastDataFromJson(Map<String, dynamic> json) {
  return _WeatherForecastData.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecastData {
  List<WeatherData> get list => throw _privateConstructorUsedError;
  WeatherDataCity get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherForecastDataCopyWith<WeatherForecastData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastDataCopyWith<$Res> {
  factory $WeatherForecastDataCopyWith(
          WeatherForecastData value, $Res Function(WeatherForecastData) then) =
      _$WeatherForecastDataCopyWithImpl<$Res, WeatherForecastData>;
  @useResult
  $Res call({List<WeatherData> list, WeatherDataCity city});

  $WeatherDataCityCopyWith<$Res> get city;
}

/// @nodoc
class _$WeatherForecastDataCopyWithImpl<$Res, $Val extends WeatherForecastData>
    implements $WeatherForecastDataCopyWith<$Res> {
  _$WeatherForecastDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? city = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<WeatherData>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as WeatherDataCity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCityCopyWith<$Res> get city {
    return $WeatherDataCityCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherForecastDataImplCopyWith<$Res>
    implements $WeatherForecastDataCopyWith<$Res> {
  factory _$$WeatherForecastDataImplCopyWith(_$WeatherForecastDataImpl value,
          $Res Function(_$WeatherForecastDataImpl) then) =
      __$$WeatherForecastDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeatherData> list, WeatherDataCity city});

  @override
  $WeatherDataCityCopyWith<$Res> get city;
}

/// @nodoc
class __$$WeatherForecastDataImplCopyWithImpl<$Res>
    extends _$WeatherForecastDataCopyWithImpl<$Res, _$WeatherForecastDataImpl>
    implements _$$WeatherForecastDataImplCopyWith<$Res> {
  __$$WeatherForecastDataImplCopyWithImpl(_$WeatherForecastDataImpl _value,
      $Res Function(_$WeatherForecastDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? city = null,
  }) {
    return _then(_$WeatherForecastDataImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<WeatherData>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as WeatherDataCity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherForecastDataImpl implements _WeatherForecastData {
  const _$WeatherForecastDataImpl(
      {required final List<WeatherData> list, required this.city})
      : _list = list;

  factory _$WeatherForecastDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherForecastDataImplFromJson(json);

  final List<WeatherData> _list;
  @override
  List<WeatherData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final WeatherDataCity city;

  @override
  String toString() {
    return 'WeatherForecastData(list: $list, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastDataImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastDataImplCopyWith<_$WeatherForecastDataImpl> get copyWith =>
      __$$WeatherForecastDataImplCopyWithImpl<_$WeatherForecastDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherForecastDataImplToJson(
      this,
    );
  }
}

abstract class _WeatherForecastData implements WeatherForecastData {
  const factory _WeatherForecastData(
      {required final List<WeatherData> list,
      required final WeatherDataCity city}) = _$WeatherForecastDataImpl;

  factory _WeatherForecastData.fromJson(Map<String, dynamic> json) =
      _$WeatherForecastDataImpl.fromJson;

  @override
  List<WeatherData> get list;
  @override
  WeatherDataCity get city;
  @override
  @JsonKey(ignore: true)
  _$$WeatherForecastDataImplCopyWith<_$WeatherForecastDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
