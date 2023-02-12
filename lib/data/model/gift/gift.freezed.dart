// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'gift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gift _$GiftFromJson(Map<String, dynamic> json) {
  return _Gift.fromJson(json);
}

/// @nodoc
class _$GiftTearOff {
  const _$GiftTearOff();

  _Gift call(
      {String? image_url,
      int? is_active,
      Object? updated_at,
      Object? image_path,
      String? name,
      Object? created_at,
      int? id,
      int? point,
      int? qty,
      int? qty_used,
      String? description}) {
    return _Gift(
      image_url: image_url,
      is_active: is_active,
      updated_at: updated_at,
      image_path: image_path,
      name: name,
      created_at: created_at,
      id: id,
      point: point,
      qty: qty,
      qty_used: qty_used,
      description: description,
    );
  }

  Gift fromJson(Map<String, Object> json) {
    return Gift.fromJson(json);
  }
}

/// @nodoc
const $Gift = _$GiftTearOff();

/// @nodoc
mixin _$Gift {
  String? get image_url => throw _privateConstructorUsedError;
  int? get is_active => throw _privateConstructorUsedError;
  Object? get updated_at => throw _privateConstructorUsedError;
  Object? get image_path => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Object? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  int? get qty => throw _privateConstructorUsedError; //tổng số đã đổi
  int? get qty_used => throw _privateConstructorUsedError; //tổng số còn lại
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftCopyWith<Gift> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCopyWith<$Res> {
  factory $GiftCopyWith(Gift value, $Res Function(Gift) then) =
      _$GiftCopyWithImpl<$Res>;
  $Res call(
      {String? image_url,
      int? is_active,
      Object? updated_at,
      Object? image_path,
      String? name,
      Object? created_at,
      int? id,
      int? point,
      int? qty,
      int? qty_used,
      String? description});
}

/// @nodoc
class _$GiftCopyWithImpl<$Res> implements $GiftCopyWith<$Res> {
  _$GiftCopyWithImpl(this._value, this._then);

  final Gift _value;
  // ignore: unused_field
  final $Res Function(Gift) _then;

  @override
  $Res call({
    Object? image_url = freezed,
    Object? is_active = freezed,
    Object? updated_at = freezed,
    Object? image_path = freezed,
    Object? name = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? point = freezed,
    Object? qty = freezed,
    Object? qty_used = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      is_active: is_active == freezed
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      image_path: image_path == freezed ? _value.image_path : image_path,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      qty_used: qty_used == freezed
          ? _value.qty_used
          : qty_used // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GiftCopyWith<$Res> implements $GiftCopyWith<$Res> {
  factory _$GiftCopyWith(_Gift value, $Res Function(_Gift) then) =
      __$GiftCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? image_url,
      int? is_active,
      Object? updated_at,
      Object? image_path,
      String? name,
      Object? created_at,
      int? id,
      int? point,
      int? qty,
      int? qty_used,
      String? description});
}

/// @nodoc
class __$GiftCopyWithImpl<$Res> extends _$GiftCopyWithImpl<$Res>
    implements _$GiftCopyWith<$Res> {
  __$GiftCopyWithImpl(_Gift _value, $Res Function(_Gift) _then)
      : super(_value, (v) => _then(v as _Gift));

  @override
  _Gift get _value => super._value as _Gift;

  @override
  $Res call({
    Object? image_url = freezed,
    Object? is_active = freezed,
    Object? updated_at = freezed,
    Object? image_path = freezed,
    Object? name = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? point = freezed,
    Object? qty = freezed,
    Object? qty_used = freezed,
    Object? description = freezed,
  }) {
    return _then(_Gift(
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      is_active: is_active == freezed
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      image_path: image_path == freezed ? _value.image_path : image_path,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      qty_used: qty_used == freezed
          ? _value.qty_used
          : qty_used // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Gift implements _Gift {
  _$_Gift(
      {this.image_url,
      this.is_active,
      this.updated_at,
      this.image_path,
      this.name,
      this.created_at,
      this.id,
      this.point,
      this.qty,
      this.qty_used,
      this.description});

  factory _$_Gift.fromJson(Map<String, dynamic> json) =>
      _$_$_GiftFromJson(json);

  @override
  final String? image_url;
  @override
  final int? is_active;
  @override
  final Object? updated_at;
  @override
  final Object? image_path;
  @override
  final String? name;
  @override
  final Object? created_at;
  @override
  final int? id;
  @override
  final int? point;
  @override
  final int? qty;
  @override //tổng số đã đổi
  final int? qty_used;
  @override //tổng số còn lại
  final String? description;

  @override
  String toString() {
    return 'Gift(image_url: $image_url, is_active: $is_active, updated_at: $updated_at, image_path: $image_path, name: $name, created_at: $created_at, id: $id, point: $point, qty: $qty, qty_used: $qty_used, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gift &&
            (identical(other.image_url, image_url) ||
                const DeepCollectionEquality()
                    .equals(other.image_url, image_url)) &&
            (identical(other.is_active, is_active) ||
                const DeepCollectionEquality()
                    .equals(other.is_active, is_active)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.image_path, image_path) ||
                const DeepCollectionEquality()
                    .equals(other.image_path, image_path)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)) &&
            (identical(other.qty, qty) ||
                const DeepCollectionEquality().equals(other.qty, qty)) &&
            (identical(other.qty_used, qty_used) ||
                const DeepCollectionEquality()
                    .equals(other.qty_used, qty_used)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image_url) ^
      const DeepCollectionEquality().hash(is_active) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(image_path) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(point) ^
      const DeepCollectionEquality().hash(qty) ^
      const DeepCollectionEquality().hash(qty_used) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$GiftCopyWith<_Gift> get copyWith =>
      __$GiftCopyWithImpl<_Gift>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GiftToJson(this);
  }
}

abstract class _Gift implements Gift {
  factory _Gift(
      {String? image_url,
      int? is_active,
      Object? updated_at,
      Object? image_path,
      String? name,
      Object? created_at,
      int? id,
      int? point,
      int? qty,
      int? qty_used,
      String? description}) = _$_Gift;

  factory _Gift.fromJson(Map<String, dynamic> json) = _$_Gift.fromJson;

  @override
  String? get image_url => throw _privateConstructorUsedError;
  @override
  int? get is_active => throw _privateConstructorUsedError;
  @override
  Object? get updated_at => throw _privateConstructorUsedError;
  @override
  Object? get image_path => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  Object? get created_at => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get point => throw _privateConstructorUsedError;
  @override
  int? get qty => throw _privateConstructorUsedError;
  @override //tổng số đã đổi
  int? get qty_used => throw _privateConstructorUsedError;
  @override //tổng số còn lại
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GiftCopyWith<_Gift> get copyWith => throw _privateConstructorUsedError;
}
