// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'setting_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingObject _$SettingObjectFromJson(Map<String, dynamic> json) {
  return _SettingObject.fromJson(json);
}

/// @nodoc
class _$SettingObjectTearOff {
  const _$SettingObjectTearOff();

  _SettingObject call(
      {Object? updated_at,
      Object? created_at,
      int? id,
      String? value,
      String? key,
      String? group}) {
    return _SettingObject(
      updated_at: updated_at,
      created_at: created_at,
      id: id,
      value: value,
      key: key,
      group: group,
    );
  }

  SettingObject fromJson(Map<String, Object> json) {
    return SettingObject.fromJson(json);
  }
}

/// @nodoc
const $SettingObject = _$SettingObjectTearOff();

/// @nodoc
mixin _$SettingObject {
  Object? get updated_at => throw _privateConstructorUsedError;
  Object? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingObjectCopyWith<SettingObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingObjectCopyWith<$Res> {
  factory $SettingObjectCopyWith(
          SettingObject value, $Res Function(SettingObject) then) =
      _$SettingObjectCopyWithImpl<$Res>;
  $Res call(
      {Object? updated_at,
      Object? created_at,
      int? id,
      String? value,
      String? key,
      String? group});
}

/// @nodoc
class _$SettingObjectCopyWithImpl<$Res>
    implements $SettingObjectCopyWith<$Res> {
  _$SettingObjectCopyWithImpl(this._value, this._then);

  final SettingObject _value;
  // ignore: unused_field
  final $Res Function(SettingObject) _then;

  @override
  $Res call({
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? value = freezed,
    Object? key = freezed,
    Object? group = freezed,
  }) {
    return _then(_value.copyWith(
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SettingObjectCopyWith<$Res>
    implements $SettingObjectCopyWith<$Res> {
  factory _$SettingObjectCopyWith(
          _SettingObject value, $Res Function(_SettingObject) then) =
      __$SettingObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {Object? updated_at,
      Object? created_at,
      int? id,
      String? value,
      String? key,
      String? group});
}

/// @nodoc
class __$SettingObjectCopyWithImpl<$Res>
    extends _$SettingObjectCopyWithImpl<$Res>
    implements _$SettingObjectCopyWith<$Res> {
  __$SettingObjectCopyWithImpl(
      _SettingObject _value, $Res Function(_SettingObject) _then)
      : super(_value, (v) => _then(v as _SettingObject));

  @override
  _SettingObject get _value => super._value as _SettingObject;

  @override
  $Res call({
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? value = freezed,
    Object? key = freezed,
    Object? group = freezed,
  }) {
    return _then(_SettingObject(
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SettingObject implements _SettingObject {
  _$_SettingObject(
      {this.updated_at,
      this.created_at,
      this.id,
      this.value,
      this.key,
      this.group});

  factory _$_SettingObject.fromJson(Map<String, dynamic> json) =>
      _$_$_SettingObjectFromJson(json);

  @override
  final Object? updated_at;
  @override
  final Object? created_at;
  @override
  final int? id;
  @override
  final String? value;
  @override
  final String? key;
  @override
  final String? group;

  @override
  String toString() {
    return 'SettingObject(updated_at: $updated_at, created_at: $created_at, id: $id, value: $value, key: $key, group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingObject &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.group, group) ||
                const DeepCollectionEquality().equals(other.group, group)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(group);

  @JsonKey(ignore: true)
  @override
  _$SettingObjectCopyWith<_SettingObject> get copyWith =>
      __$SettingObjectCopyWithImpl<_SettingObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SettingObjectToJson(this);
  }
}

abstract class _SettingObject implements SettingObject {
  factory _SettingObject(
      {Object? updated_at,
      Object? created_at,
      int? id,
      String? value,
      String? key,
      String? group}) = _$_SettingObject;

  factory _SettingObject.fromJson(Map<String, dynamic> json) =
      _$_SettingObject.fromJson;

  @override
  Object? get updated_at => throw _privateConstructorUsedError;
  @override
  Object? get created_at => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get value => throw _privateConstructorUsedError;
  @override
  String? get key => throw _privateConstructorUsedError;
  @override
  String? get group => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingObjectCopyWith<_SettingObject> get copyWith =>
      throw _privateConstructorUsedError;
}
