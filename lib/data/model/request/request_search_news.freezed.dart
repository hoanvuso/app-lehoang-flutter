// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_search_news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestSearchNews _$RequestSearchNewsFromJson(Map<String, dynamic> json) {
  return _RequestSearchNews.fromJson(json);
}

/// @nodoc
class _$RequestSearchNewsTearOff {
  const _$RequestSearchNewsTearOff();

  _RequestSearchNews call(
      {String? type, int? limit, int? page, int? is_new, String? keywords}) {
    return _RequestSearchNews(
      type: type,
      limit: limit,
      page: page,
      is_new: is_new,
      keywords: keywords,
    );
  }

  RequestSearchNews fromJson(Map<String, Object> json) {
    return RequestSearchNews.fromJson(json);
  }
}

/// @nodoc
const $RequestSearchNews = _$RequestSearchNewsTearOff();

/// @nodoc
mixin _$RequestSearchNews {
  String? get type => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get is_new => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestSearchNewsCopyWith<RequestSearchNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSearchNewsCopyWith<$Res> {
  factory $RequestSearchNewsCopyWith(
          RequestSearchNews value, $Res Function(RequestSearchNews) then) =
      _$RequestSearchNewsCopyWithImpl<$Res>;
  $Res call(
      {String? type, int? limit, int? page, int? is_new, String? keywords});
}

/// @nodoc
class _$RequestSearchNewsCopyWithImpl<$Res>
    implements $RequestSearchNewsCopyWith<$Res> {
  _$RequestSearchNewsCopyWithImpl(this._value, this._then);

  final RequestSearchNews _value;
  // ignore: unused_field
  final $Res Function(RequestSearchNews) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? is_new = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$RequestSearchNewsCopyWith<$Res>
    implements $RequestSearchNewsCopyWith<$Res> {
  factory _$RequestSearchNewsCopyWith(
          _RequestSearchNews value, $Res Function(_RequestSearchNews) then) =
      __$RequestSearchNewsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? type, int? limit, int? page, int? is_new, String? keywords});
}

/// @nodoc
class __$RequestSearchNewsCopyWithImpl<$Res>
    extends _$RequestSearchNewsCopyWithImpl<$Res>
    implements _$RequestSearchNewsCopyWith<$Res> {
  __$RequestSearchNewsCopyWithImpl(
      _RequestSearchNews _value, $Res Function(_RequestSearchNews) _then)
      : super(_value, (v) => _then(v as _RequestSearchNews));

  @override
  _RequestSearchNews get _value => super._value as _RequestSearchNews;

  @override
  $Res call({
    Object? type = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? is_new = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_RequestSearchNews(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_RequestSearchNews extends _RequestSearchNews {
  _$_RequestSearchNews(
      {this.type, this.limit, this.page, this.is_new, this.keywords})
      : super._();

  factory _$_RequestSearchNews.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestSearchNewsFromJson(json);

  @override
  final String? type;
  @override
  final int? limit;
  @override
  final int? page;
  @override
  final int? is_new;
  @override
  final String? keywords;

  @override
  String toString() {
    return 'RequestSearchNews(type: $type, limit: $limit, page: $page, is_new: $is_new, keywords: $keywords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestSearchNews &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
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
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(is_new) ^
      const DeepCollectionEquality().hash(keywords);

  @JsonKey(ignore: true)
  @override
  _$RequestSearchNewsCopyWith<_RequestSearchNews> get copyWith =>
      __$RequestSearchNewsCopyWithImpl<_RequestSearchNews>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestSearchNewsToJson(this);
  }
}

abstract class _RequestSearchNews extends RequestSearchNews {
  factory _RequestSearchNews(
      {String? type,
      int? limit,
      int? page,
      int? is_new,
      String? keywords}) = _$_RequestSearchNews;
  _RequestSearchNews._() : super._();

  factory _RequestSearchNews.fromJson(Map<String, dynamic> json) =
      _$_RequestSearchNews.fromJson;

  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  int? get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  int? get is_new => throw _privateConstructorUsedError;
  @override
  String? get keywords => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestSearchNewsCopyWith<_RequestSearchNews> get copyWith =>
      throw _privateConstructorUsedError;
}
