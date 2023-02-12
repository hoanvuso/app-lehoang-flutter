// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_category_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductCategoryFeature _$ProductCategoryFeatureFromJson(
    Map<String, dynamic> json) {
  return _ProductCategoryFeature.fromJson(json);
}

/// @nodoc
class _$ProductCategoryFeatureTearOff {
  const _$ProductCategoryFeatureTearOff();

  _ProductCategoryFeature call(
      {int? category_id,
      String? updated_at,
      String? name,
      String? created_at,
      int? id,
      String? slug}) {
    return _ProductCategoryFeature(
      category_id: category_id,
      updated_at: updated_at,
      name: name,
      created_at: created_at,
      id: id,
      slug: slug,
    );
  }

  ProductCategoryFeature fromJson(Map<String, Object> json) {
    return ProductCategoryFeature.fromJson(json);
  }
}

/// @nodoc
const $ProductCategoryFeature = _$ProductCategoryFeatureTearOff();

/// @nodoc
mixin _$ProductCategoryFeature {
  int? get category_id => throw _privateConstructorUsedError;
  String? get updated_at => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCategoryFeatureCopyWith<ProductCategoryFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryFeatureCopyWith<$Res> {
  factory $ProductCategoryFeatureCopyWith(ProductCategoryFeature value,
          $Res Function(ProductCategoryFeature) then) =
      _$ProductCategoryFeatureCopyWithImpl<$Res>;
  $Res call(
      {int? category_id,
      String? updated_at,
      String? name,
      String? created_at,
      int? id,
      String? slug});
}

/// @nodoc
class _$ProductCategoryFeatureCopyWithImpl<$Res>
    implements $ProductCategoryFeatureCopyWith<$Res> {
  _$ProductCategoryFeatureCopyWithImpl(this._value, this._then);

  final ProductCategoryFeature _value;
  // ignore: unused_field
  final $Res Function(ProductCategoryFeature) _then;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? updated_at = freezed,
    Object? name = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProductCategoryFeatureCopyWith<$Res>
    implements $ProductCategoryFeatureCopyWith<$Res> {
  factory _$ProductCategoryFeatureCopyWith(_ProductCategoryFeature value,
          $Res Function(_ProductCategoryFeature) then) =
      __$ProductCategoryFeatureCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? category_id,
      String? updated_at,
      String? name,
      String? created_at,
      int? id,
      String? slug});
}

/// @nodoc
class __$ProductCategoryFeatureCopyWithImpl<$Res>
    extends _$ProductCategoryFeatureCopyWithImpl<$Res>
    implements _$ProductCategoryFeatureCopyWith<$Res> {
  __$ProductCategoryFeatureCopyWithImpl(_ProductCategoryFeature _value,
      $Res Function(_ProductCategoryFeature) _then)
      : super(_value, (v) => _then(v as _ProductCategoryFeature));

  @override
  _ProductCategoryFeature get _value => super._value as _ProductCategoryFeature;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? updated_at = freezed,
    Object? name = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? slug = freezed,
  }) {
    return _then(_ProductCategoryFeature(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProductCategoryFeature implements _ProductCategoryFeature {
  _$_ProductCategoryFeature(
      {this.category_id,
      this.updated_at,
      this.name,
      this.created_at,
      this.id,
      this.slug});

  factory _$_ProductCategoryFeature.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductCategoryFeatureFromJson(json);

  @override
  final int? category_id;
  @override
  final String? updated_at;
  @override
  final String? name;
  @override
  final String? created_at;
  @override
  final int? id;
  @override
  final String? slug;

  @override
  String toString() {
    return 'ProductCategoryFeature(category_id: $category_id, updated_at: $updated_at, name: $name, created_at: $created_at, id: $id, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductCategoryFeature &&
            (identical(other.category_id, category_id) ||
                const DeepCollectionEquality()
                    .equals(other.category_id, category_id)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(category_id) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(slug);

  @JsonKey(ignore: true)
  @override
  _$ProductCategoryFeatureCopyWith<_ProductCategoryFeature> get copyWith =>
      __$ProductCategoryFeatureCopyWithImpl<_ProductCategoryFeature>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductCategoryFeatureToJson(this);
  }
}

abstract class _ProductCategoryFeature implements ProductCategoryFeature {
  factory _ProductCategoryFeature(
      {int? category_id,
      String? updated_at,
      String? name,
      String? created_at,
      int? id,
      String? slug}) = _$_ProductCategoryFeature;

  factory _ProductCategoryFeature.fromJson(Map<String, dynamic> json) =
      _$_ProductCategoryFeature.fromJson;

  @override
  int? get category_id => throw _privateConstructorUsedError;
  @override
  String? get updated_at => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get created_at => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get slug => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCategoryFeatureCopyWith<_ProductCategoryFeature> get copyWith =>
      throw _privateConstructorUsedError;
}
