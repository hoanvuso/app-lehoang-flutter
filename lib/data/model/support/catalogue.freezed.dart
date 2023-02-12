// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'catalogue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Catalogue _$CatalogueFromJson(Map<String, dynamic> json) {
  return _Catalogue.fromJson(json);
}

/// @nodoc
class _$CatalogueTearOff {
  const _$CatalogueTearOff();

  _Catalogue call(
      {int? is_active,
      Object? updated_at,
      int? ordering,
      String? name,
      String? link,
      Object? created_at,
      int? id}) {
    return _Catalogue(
      is_active: is_active,
      updated_at: updated_at,
      ordering: ordering,
      name: name,
      link: link,
      created_at: created_at,
      id: id,
    );
  }

  Catalogue fromJson(Map<String, Object> json) {
    return Catalogue.fromJson(json);
  }
}

/// @nodoc
const $Catalogue = _$CatalogueTearOff();

/// @nodoc
mixin _$Catalogue {
  int? get is_active => throw _privateConstructorUsedError;
  Object? get updated_at => throw _privateConstructorUsedError;
  int? get ordering => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  Object? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogueCopyWith<Catalogue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogueCopyWith<$Res> {
  factory $CatalogueCopyWith(Catalogue value, $Res Function(Catalogue) then) =
      _$CatalogueCopyWithImpl<$Res>;
  $Res call(
      {int? is_active,
      Object? updated_at,
      int? ordering,
      String? name,
      String? link,
      Object? created_at,
      int? id});
}

/// @nodoc
class _$CatalogueCopyWithImpl<$Res> implements $CatalogueCopyWith<$Res> {
  _$CatalogueCopyWithImpl(this._value, this._then);

  final Catalogue _value;
  // ignore: unused_field
  final $Res Function(Catalogue) _then;

  @override
  $Res call({
    Object? is_active = freezed,
    Object? updated_at = freezed,
    Object? ordering = freezed,
    Object? name = freezed,
    Object? link = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      is_active: is_active == freezed
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
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
abstract class _$CatalogueCopyWith<$Res> implements $CatalogueCopyWith<$Res> {
  factory _$CatalogueCopyWith(
          _Catalogue value, $Res Function(_Catalogue) then) =
      __$CatalogueCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? is_active,
      Object? updated_at,
      int? ordering,
      String? name,
      String? link,
      Object? created_at,
      int? id});
}

/// @nodoc
class __$CatalogueCopyWithImpl<$Res> extends _$CatalogueCopyWithImpl<$Res>
    implements _$CatalogueCopyWith<$Res> {
  __$CatalogueCopyWithImpl(_Catalogue _value, $Res Function(_Catalogue) _then)
      : super(_value, (v) => _then(v as _Catalogue));

  @override
  _Catalogue get _value => super._value as _Catalogue;

  @override
  $Res call({
    Object? is_active = freezed,
    Object? updated_at = freezed,
    Object? ordering = freezed,
    Object? name = freezed,
    Object? link = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_Catalogue(
      is_active: is_active == freezed
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed ? _value.updated_at : updated_at,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
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
class _$_Catalogue implements _Catalogue {
  _$_Catalogue(
      {this.is_active,
      this.updated_at,
      this.ordering,
      this.name,
      this.link,
      this.created_at,
      this.id});

  factory _$_Catalogue.fromJson(Map<String, dynamic> json) =>
      _$_$_CatalogueFromJson(json);

  @override
  final int? is_active;
  @override
  final Object? updated_at;
  @override
  final int? ordering;
  @override
  final String? name;
  @override
  final String? link;
  @override
  final Object? created_at;
  @override
  final int? id;

  @override
  String toString() {
    return 'Catalogue(is_active: $is_active, updated_at: $updated_at, ordering: $ordering, name: $name, link: $link, created_at: $created_at, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Catalogue &&
            (identical(other.is_active, is_active) ||
                const DeepCollectionEquality()
                    .equals(other.is_active, is_active)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.ordering, ordering) ||
                const DeepCollectionEquality()
                    .equals(other.ordering, ordering)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(is_active) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(ordering) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$CatalogueCopyWith<_Catalogue> get copyWith =>
      __$CatalogueCopyWithImpl<_Catalogue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CatalogueToJson(this);
  }
}

abstract class _Catalogue implements Catalogue {
  factory _Catalogue(
      {int? is_active,
      Object? updated_at,
      int? ordering,
      String? name,
      String? link,
      Object? created_at,
      int? id}) = _$_Catalogue;

  factory _Catalogue.fromJson(Map<String, dynamic> json) =
      _$_Catalogue.fromJson;

  @override
  int? get is_active => throw _privateConstructorUsedError;
  @override
  Object? get updated_at => throw _privateConstructorUsedError;
  @override
  int? get ordering => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get link => throw _privateConstructorUsedError;
  @override
  Object? get created_at => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CatalogueCopyWith<_Catalogue> get copyWith =>
      throw _privateConstructorUsedError;
}
