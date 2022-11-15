// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geocode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeocodeModel _$GeocodeModelFromJson(Map<String, dynamic> json) {
  return _GeocodeModel.fromJson(json);
}

/// @nodoc
mixin _$GeocodeModel {
  String get name => throw _privateConstructorUsedError;
  num get lat => throw _privateConstructorUsedError;
  num get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeModelCopyWith<GeocodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeModelCopyWith<$Res> {
  factory $GeocodeModelCopyWith(
          GeocodeModel value, $Res Function(GeocodeModel) then) =
      _$GeocodeModelCopyWithImpl<$Res, GeocodeModel>;
  @useResult
  $Res call({String name, num lat, num lon});
}

/// @nodoc
class _$GeocodeModelCopyWithImpl<$Res, $Val extends GeocodeModel>
    implements $GeocodeModelCopyWith<$Res> {
  _$GeocodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeocodeModelCopyWith<$Res>
    implements $GeocodeModelCopyWith<$Res> {
  factory _$$_GeocodeModelCopyWith(
          _$_GeocodeModel value, $Res Function(_$_GeocodeModel) then) =
      __$$_GeocodeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, num lat, num lon});
}

/// @nodoc
class __$$_GeocodeModelCopyWithImpl<$Res>
    extends _$GeocodeModelCopyWithImpl<$Res, _$_GeocodeModel>
    implements _$$_GeocodeModelCopyWith<$Res> {
  __$$_GeocodeModelCopyWithImpl(
      _$_GeocodeModel _value, $Res Function(_$_GeocodeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$_GeocodeModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeocodeModel implements _GeocodeModel {
  const _$_GeocodeModel(
      {required this.name, required this.lat, required this.lon});

  factory _$_GeocodeModel.fromJson(Map<String, dynamic> json) =>
      _$$_GeocodeModelFromJson(json);

  @override
  final String name;
  @override
  final num lat;
  @override
  final num lon;

  @override
  String toString() {
    return 'GeocodeModel(name: $name, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeocodeModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeocodeModelCopyWith<_$_GeocodeModel> get copyWith =>
      __$$_GeocodeModelCopyWithImpl<_$_GeocodeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeocodeModelToJson(
      this,
    );
  }
}

abstract class _GeocodeModel implements GeocodeModel {
  const factory _GeocodeModel(
      {required final String name,
      required final num lat,
      required final num lon}) = _$_GeocodeModel;

  factory _GeocodeModel.fromJson(Map<String, dynamic> json) =
      _$_GeocodeModel.fromJson;

  @override
  String get name;
  @override
  num get lat;
  @override
  num get lon;
  @override
  @JsonKey(ignore: true)
  _$$_GeocodeModelCopyWith<_$_GeocodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
