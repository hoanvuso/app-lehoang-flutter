// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_search_product_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestSearchProductCategory _$RequestSearchProductCategoryFromJson(
    Map<String, dynamic> json) {
  return _RequestSearchProductCategory.fromJson(json);
}

/// @nodoc
class _$RequestSearchProductCategoryTearOff {
  const _$RequestSearchProductCategoryTearOff();

  _RequestSearchProductCategory call(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      String? keywords}) {
    return _RequestSearchProductCategory(
      category_id: category_id,
      trademark_id: trademark_id,
      limit: limit,
      page: page,
      keywords: keywords,
    );
  }

  RequestSearchProductCategory fromJson(Map<String, Object> json) {
    return RequestSearchProductCategory.fromJson(json);
  }
}

/// @nodoc
const $RequestSearchProductCategory = _$RequestSearchProductCategoryTearOff();

/// @nodoc
mixin _$RequestSearchProductCategory {
  int? get category_id => throw _privateConstructorUsedError;
  int? get trademark_id => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestSearchProductCategoryCopyWith<RequestSearchProductCategory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSearchProductCategoryCopyWith<$Res> {
  factory $RequestSearchProductCategoryCopyWith(
          RequestSearchProductCategory value,
          $Res Function(RequestSearchProductCategory) then) =
      _$RequestSearchProductCategoryCopyWithImpl<$Res>;
  $Res call(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      String? keywords});
}

/// @nodoc
class _$RequestSearchProductCategoryCopyWithImpl<$Res>
    implements $RequestSearchProductCategoryCopyWith<$Res> {
  _$RequestSearchProductCategoryCopyWithImpl(this._value, this._then);

  final RequestSearchProductCategory _value;
  // ignore: unused_field
  final $Res Function(RequestSearchProductCategory) _then;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? trademark_id = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_value.copyWith(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int?,
      trademark_id: trademark_id == freezed
          ? _value.trademark_id
          : trademark_id // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestSearchProductCategoryCopyWith<$Res>
    implements $RequestSearchProductCategoryCopyWith<$Res> {
  factory _$RequestSearchProductCategoryCopyWith(
          _RequestSearchProductCategory value,
          $Res Function(_RequestSearchProductCategory) then) =
      __$RequestSearchProductCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      String? keywords});
}

/// @nodoc
class __$RequestSearchProductCategoryCopyWithImpl<$Res>
    extends _$RequestSearchProductCategoryCopyWithImpl<$Res>
    implements _$RequestSearchProductCategoryCopyWith<$Res> {
  __$RequestSearchProductCategoryCopyWithImpl(
      _RequestSearchProductCategory _value,
      $Res Function(_RequestSearchProductCategory) _then)
      : super(_value, (v) => _then(v as _RequestSearchProductCategory));

  @override
  _RequestSearchProductCategory get _value =>
      super._value as _RequestSearchProductCategory;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? trademark_id = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_RequestSearchProductCategory(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int?,
      trademark_id: trademark_id == freezed
          ? _value.trademark_id
          : trademark_id // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestSearchProductCategory extends _RequestSearchProductCategory {
  _$_RequestSearchProductCategory(
      {this.category_id,
      this.trademark_id,
      this.limit,
      this.page,
      this.keywords})
      : super._();

  factory _$_RequestSearchProductCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestSearchProductCategoryFromJson(json);

  @override
  final int? category_id;
  @override
  final int? trademark_id;
  @override
  final int? limit;
  @override
  final int? page;
  @override
  final String? keywords;

  @override
  String toString() {
    return 'RequestSearchProductCategory(category_id: $category_id, trademark_id: $trademark_id, limit: $limit, page: $page, keywords: $keywords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestSearchProductCategory &&
            (identical(other.category_id, category_id) ||
                const DeepCollectionEquality()
                    .equals(other.category_id, category_id)) &&
            (identical(other.trademark_id, trademark_id) ||
                const DeepCollectionEquality()
                    .equals(other.trademark_id, trademark_id)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.keywords, keywords) ||
                const DeepCollectionEquality()
                    .equals(other.keywords, keywords)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(category_id) ^
      const DeepCollectionEquality().hash(trademark_id) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(keywords);

  @JsonKey(ignore: true)
  @override
  _$RequestSearchProductCategoryCopyWith<_RequestSearchProductCategory>
      get copyWith => __$RequestSearchProductCategoryCopyWithImpl<
          _RequestSearchProductCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestSearchProductCategoryToJson(this);
  }
}

abstract class _RequestSearchProductCategory
    extends RequestSearchProductCategory {
  factory _RequestSearchProductCategory(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      String? keywords}) = _$_RequestSearchProductCategory;
  _RequestSearchProductCategory._() : super._();

  factory _RequestSearchProductCategory.fromJson(Map<String, dynamic> json) =
      _$_RequestSearchProductCategory.fromJson;

  @override
  int? get category_id => throw _privateConstructorUsedError;
  @override
  int? get trademark_id => throw _privateConstructorUsedError;
  @override
  int? get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  String? get keywords => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestSearchProductCategoryCopyWith<_RequestSearchProductCategory>
      get copyWith => throw _privateConstructorUsedError;
}
