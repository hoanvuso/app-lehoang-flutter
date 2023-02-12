// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_search_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestSearchProduct _$RequestSearchProductFromJson(Map<String, dynamic> json) {
  return _RequestSearchProduct.fromJson(json);
}

/// @nodoc
class _$RequestSearchProductTearOff {
  const _$RequestSearchProductTearOff();

  _RequestSearchProduct call(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      int? is_new,
      String? keywords}) {
    return _RequestSearchProduct(
      category_id: category_id,
      trademark_id: trademark_id,
      limit: limit,
      page: page,
      is_new: is_new,
      keywords: keywords,
    );
  }

  RequestSearchProduct fromJson(Map<String, Object> json) {
    return RequestSearchProduct.fromJson(json);
  }
}

/// @nodoc
const $RequestSearchProduct = _$RequestSearchProductTearOff();

/// @nodoc
mixin _$RequestSearchProduct {
  int? get category_id => throw _privateConstructorUsedError;
  int? get trademark_id => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get is_new =>
      throw _privateConstructorUsedError; //lấy sản phẩm mới thì is_new = 1
  String? get keywords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestSearchProductCopyWith<RequestSearchProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSearchProductCopyWith<$Res> {
  factory $RequestSearchProductCopyWith(RequestSearchProduct value,
          $Res Function(RequestSearchProduct) then) =
      _$RequestSearchProductCopyWithImpl<$Res>;
  $Res call(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      int? is_new,
      String? keywords});
}

/// @nodoc
class _$RequestSearchProductCopyWithImpl<$Res>
    implements $RequestSearchProductCopyWith<$Res> {
  _$RequestSearchProductCopyWithImpl(this._value, this._then);

  final RequestSearchProduct _value;
  // ignore: unused_field
  final $Res Function(RequestSearchProduct) _then;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? trademark_id = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? is_new = freezed,
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
      is_new: is_new == freezed
          ? _value.is_new
          : is_new // ignore: cast_nullable_to_non_nullable
              as int?,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestSearchProductCopyWith<$Res>
    implements $RequestSearchProductCopyWith<$Res> {
  factory _$RequestSearchProductCopyWith(_RequestSearchProduct value,
          $Res Function(_RequestSearchProduct) then) =
      __$RequestSearchProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      int? is_new,
      String? keywords});
}

/// @nodoc
class __$RequestSearchProductCopyWithImpl<$Res>
    extends _$RequestSearchProductCopyWithImpl<$Res>
    implements _$RequestSearchProductCopyWith<$Res> {
  __$RequestSearchProductCopyWithImpl(
      _RequestSearchProduct _value, $Res Function(_RequestSearchProduct) _then)
      : super(_value, (v) => _then(v as _RequestSearchProduct));

  @override
  _RequestSearchProduct get _value => super._value as _RequestSearchProduct;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? trademark_id = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? is_new = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_RequestSearchProduct(
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
      is_new: is_new == freezed
          ? _value.is_new
          : is_new // ignore: cast_nullable_to_non_nullable
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
class _$_RequestSearchProduct extends _RequestSearchProduct {
  _$_RequestSearchProduct(
      {this.category_id,
      this.trademark_id,
      this.limit,
      this.page,
      this.is_new,
      this.keywords})
      : super._();

  factory _$_RequestSearchProduct.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestSearchProductFromJson(json);

  @override
  final int? category_id;
  @override
  final int? trademark_id;
  @override
  final int? limit;
  @override
  final int? page;
  @override
  final int? is_new;
  @override //lấy sản phẩm mới thì is_new = 1
  final String? keywords;

  @override
  String toString() {
    return 'RequestSearchProduct(category_id: $category_id, trademark_id: $trademark_id, limit: $limit, page: $page, is_new: $is_new, keywords: $keywords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestSearchProduct &&
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
            (identical(other.is_new, is_new) ||
                const DeepCollectionEquality().equals(other.is_new, is_new)) &&
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
      const DeepCollectionEquality().hash(is_new) ^
      const DeepCollectionEquality().hash(keywords);

  @JsonKey(ignore: true)
  @override
  _$RequestSearchProductCopyWith<_RequestSearchProduct> get copyWith =>
      __$RequestSearchProductCopyWithImpl<_RequestSearchProduct>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestSearchProductToJson(this);
  }
}

abstract class _RequestSearchProduct extends RequestSearchProduct {
  factory _RequestSearchProduct(
      {int? category_id,
      int? trademark_id,
      int? limit,
      int? page,
      int? is_new,
      String? keywords}) = _$_RequestSearchProduct;
  _RequestSearchProduct._() : super._();

  factory _RequestSearchProduct.fromJson(Map<String, dynamic> json) =
      _$_RequestSearchProduct.fromJson;

  @override
  int? get category_id => throw _privateConstructorUsedError;
  @override
  int? get trademark_id => throw _privateConstructorUsedError;
  @override
  int? get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  int? get is_new => throw _privateConstructorUsedError;
  @override //lấy sản phẩm mới thì is_new = 1
  String? get keywords => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestSearchProductCopyWith<_RequestSearchProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
