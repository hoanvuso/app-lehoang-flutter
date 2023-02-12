// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'catologue_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CatologueImage _$CatologueImageFromJson(Map<String, dynamic> json) {
  return _CatologueImage.fromJson(json);
}

/// @nodoc
class _$CatologueImageTearOff {
  const _$CatologueImageTearOff();

  _CatologueImage call(
      {Object? image,
      int? catalogue_id,
      Object? updated_at,
      int? ordering,
      String? image_url,
      String? name,
      Object? created_at,
      int? id}) {
    return _CatologueImage(
      image: image,
      catalogue_id: catalogue_id,
      updated_at: updated_at,
      ordering: ordering,
      image_url: image_url,
      name: name,
      created_at: created_at,
      id: id,
    );
  }

  CatologueImage fromJson(Map<String, Object> json) {
    return CatologueImage.fromJson(json);
  }
}

/// @nodoc
const $CatologueImage = _$CatologueImageTearOff();

/// @nodoc
mixin _$CatologueImage {
  Object? get image => throw _privateConstructorUsedError;
  int? get catalogue_id => throw _privateConstructorUsedError;
  Object? get updated_at => throw _privateConstructorUsedError;
  int? get ordering => throw _privateConstructorUsedError;
  String? get image_url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Object? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatologueImageCopyWith<CatologueImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatologueImageCopyWith<$Res> {
  factory $CatologueImageCopyWith(
          CatologueImage value, $Res Function(CatologueImage) then) =
      _$CatologueImageCopyWithImpl<$Res>;
  $Res call(
      {Object? image,
      int? catalogue_id,
      Object? updated_at,
      int? ordering,
      String? image_url,
      String? name,
      Object? created_at,
      int? id});
}

/// @nodoc
class _$CatologueImageCopyWithImpl<$Res>
    implements $CatologueImageCopyWith<$Res> {
  _$CatologueImageCopyWithImpl(this._value, this._then);

  final CatologueImage _value;
  // ignore: unused_field
  final $Res Function(CatologueImage) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? catalogue_id = freezed,
    Object? updated_at = freezed,
    Object? ordering = freezed,
    Object? image_url = freezed,
    Object? name = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed ? _value.image : image,
      catalogue_id: catalogue_id == freezed
          ? _value.catalogue_id
          : catalogue_id // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int?,
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$CatologueImageCopyWith<$Res>
    implements $CatologueImageCopyWith<$Res> {
  factory _$CatologueImageCopyWith(
          _CatologueImage value, $Res Function(_CatologueImage) then) =
      __$CatologueImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {Object? image,
      int? catalogue_id,
      Object? updated_at,
      int? ordering,
      String? image_url,
      String? name,
      Object? created_at,
      int? id});
}

/// @nodoc
class __$CatologueImageCopyWithImpl<$Res>
    extends _$CatologueImageCopyWithImpl<$Res>
    implements _$CatologueImageCopyWith<$Res> {
  __$CatologueImageCopyWithImpl(
      _CatologueImage _value, $Res Function(_CatologueImage) _then)
      : super(_value, (v) => _then(v as _CatologueImage));

  @override
  _CatologueImage get _value => super._value as _CatologueImage;

  @override
  $Res call({
    Object? image = freezed,
    Object? catalogue_id = freezed,
    Object? updated_at = freezed,
    Object? ordering = freezed,
    Object? image_url = freezed,
    Object? name = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_CatologueImage(
      image: image == freezed ? _value.image : image,
      catalogue_id: catalogue_id == freezed
          ? _value.catalogue_id
          : catalogue_id // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int?,
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CatologueImage implements _CatologueImage {
  _$_CatologueImage(
      {this.image,
      this.catalogue_id,
      this.updated_at,
      this.ordering,
      this.image_url,
      this.name,
      this.created_at,
      this.id});

  factory _$_CatologueImage.fromJson(Map<String, dynamic> json) =>
      _$_$_CatologueImageFromJson(json);

  @override
  final Object? image;
  @override
  final int? catalogue_id;
  @override
  final Object? updated_at;
  @override
  final int? ordering;
  @override
  final String? image_url;
  @override
  final String? name;
  @override
  final Object? created_at;
  @override
  final int? id;

  @override
  String toString() {
    return 'CatologueImage(image: $image, catalogue_id: $catalogue_id, updated_at: $updated_at, ordering: $ordering, image_url: $image_url, name: $name, created_at: $created_at, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CatologueImage &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.catalogue_id, catalogue_id) ||
                const DeepCollectionEquality()
                    .equals(other.catalogue_id, catalogue_id)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.ordering, ordering) ||
                const DeepCollectionEquality()
                    .equals(other.ordering, ordering)) &&
            (identical(other.image_url, image_url) ||
                const DeepCollectionEquality()
                    .equals(other.image_url, image_url)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(catalogue_id) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(ordering) ^
      const DeepCollectionEquality().hash(image_url) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$CatologueImageCopyWith<_CatologueImage> get copyWith =>
      __$CatologueImageCopyWithImpl<_CatologueImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CatologueImageToJson(this);
  }
}

abstract class _CatologueImage implements CatologueImage {
  factory _CatologueImage(
      {Object? image,
      int? catalogue_id,
      Object? updated_at,
      int? ordering,
      String? image_url,
      String? name,
      Object? created_at,
      int? id}) = _$_CatologueImage;

  factory _CatologueImage.fromJson(Map<String, dynamic> json) =
      _$_CatologueImage.fromJson;

  @override
  Object? get image => throw _privateConstructorUsedError;
  @override
  int? get catalogue_id => throw _privateConstructorUsedError;
  @override
  Object? get updated_at => throw _privateConstructorUsedError;
  @override
  int? get ordering => throw _privateConstructorUsedError;
  @override
  String? get image_url => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  Object? get created_at => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CatologueImageCopyWith<_CatologueImage> get copyWith =>
      throw _privateConstructorUsedError;
}
