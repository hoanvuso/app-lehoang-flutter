// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_search_product_company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestSearchProductCompany _$RequestSearchProductCompanyFromJson(
    Map<String, dynamic> json) {
  return _RequestSearchProductCompany.fromJson(json);
}

/// @nodoc
class _$RequestSearchProductCompanyTearOff {
  const _$RequestSearchProductCompanyTearOff();

  _RequestSearchProductCompany call({int? limit, int? page, String? keywords}) {
    return _RequestSearchProductCompany(
      limit: limit,
      page: page,
      keywords: keywords,
    );
  }

  RequestSearchProductCompany fromJson(Map<String, Object> json) {
    return RequestSearchProductCompany.fromJson(json);
  }
}

/// @nodoc
const $RequestSearchProductCompany = _$RequestSearchProductCompanyTearOff();

/// @nodoc
mixin _$RequestSearchProductCompany {
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestSearchProductCompanyCopyWith<RequestSearchProductCompany>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSearchProductCompanyCopyWith<$Res> {
  factory $RequestSearchProductCompanyCopyWith(
          RequestSearchProductCompany value,
          $Res Function(RequestSearchProductCompany) then) =
      _$RequestSearchProductCompanyCopyWithImpl<$Res>;
  $Res call({int? limit, int? page, String? keywords});
}

/// @nodoc
class _$RequestSearchProductCompanyCopyWithImpl<$Res>
    implements $RequestSearchProductCompanyCopyWith<$Res> {
  _$RequestSearchProductCompanyCopyWithImpl(this._value, this._then);

  final RequestSearchProductCompany _value;
  // ignore: unused_field
  final $Res Function(RequestSearchProductCompany) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$RequestSearchProductCompanyCopyWith<$Res>
    implements $RequestSearchProductCompanyCopyWith<$Res> {
  factory _$RequestSearchProductCompanyCopyWith(
          _RequestSearchProductCompany value,
          $Res Function(_RequestSearchProductCompany) then) =
      __$RequestSearchProductCompanyCopyWithImpl<$Res>;
  @override
  $Res call({int? limit, int? page, String? keywords});
}

/// @nodoc
class __$RequestSearchProductCompanyCopyWithImpl<$Res>
    extends _$RequestSearchProductCompanyCopyWithImpl<$Res>
    implements _$RequestSearchProductCompanyCopyWith<$Res> {
  __$RequestSearchProductCompanyCopyWithImpl(
      _RequestSearchProductCompany _value,
      $Res Function(_RequestSearchProductCompany) _then)
      : super(_value, (v) => _then(v as _RequestSearchProductCompany));

  @override
  _RequestSearchProductCompany get _value =>
      super._value as _RequestSearchProductCompany;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_RequestSearchProductCompany(
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
class _$_RequestSearchProductCompany extends _RequestSearchProductCompany {
  _$_RequestSearchProductCompany({this.limit, this.page, this.keywords})
      : super._();

  factory _$_RequestSearchProductCompany.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestSearchProductCompanyFromJson(json);

  @override
  final int? limit;
  @override
  final int? page;
  @override
  final String? keywords;

  @override
  String toString() {
    return 'RequestSearchProductCompany(limit: $limit, page: $page, keywords: $keywords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestSearchProductCompany &&
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
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(keywords);

  @JsonKey(ignore: true)
  @override
  _$RequestSearchProductCompanyCopyWith<_RequestSearchProductCompany>
      get copyWith => __$RequestSearchProductCompanyCopyWithImpl<
          _RequestSearchProductCompany>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestSearchProductCompanyToJson(this);
  }
}

abstract class _RequestSearchProductCompany
    extends RequestSearchProductCompany {
  factory _RequestSearchProductCompany(
      {int? limit,
      int? page,
      String? keywords}) = _$_RequestSearchProductCompany;
  _RequestSearchProductCompany._() : super._();

  factory _RequestSearchProductCompany.fromJson(Map<String, dynamic> json) =
      _$_RequestSearchProductCompany.fromJson;

  @override
  int? get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  String? get keywords => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestSearchProductCompanyCopyWith<_RequestSearchProductCompany>
      get copyWith => throw _privateConstructorUsedError;
}
