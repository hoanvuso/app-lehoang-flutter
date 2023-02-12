// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_search_history_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestSearchHistoryPoint _$RequestSearchHistoryPointFromJson(
    Map<String, dynamic> json) {
  return _RequestSearchHistoryPoint.fromJson(json);
}

/// @nodoc
class _$RequestSearchHistoryPointTearOff {
  const _$RequestSearchHistoryPointTearOff();

  _RequestSearchHistoryPoint call(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date,
      String? type}) {
    return _RequestSearchHistoryPoint(
      limit: limit,
      page: page,
      search: search,
      start_date: start_date,
      end_date: end_date,
      type: type,
    );
  }

  RequestSearchHistoryPoint fromJson(Map<String, Object> json) {
    return RequestSearchHistoryPoint.fromJson(json);
  }
}

/// @nodoc
const $RequestSearchHistoryPoint = _$RequestSearchHistoryPointTearOff();

/// @nodoc
mixin _$RequestSearchHistoryPoint {
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get start_date => throw _privateConstructorUsedError;
  String? get end_date => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestSearchHistoryPointCopyWith<RequestSearchHistoryPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSearchHistoryPointCopyWith<$Res> {
  factory $RequestSearchHistoryPointCopyWith(RequestSearchHistoryPoint value,
          $Res Function(RequestSearchHistoryPoint) then) =
      _$RequestSearchHistoryPointCopyWithImpl<$Res>;
  $Res call(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date,
      String? type});
}

/// @nodoc
class _$RequestSearchHistoryPointCopyWithImpl<$Res>
    implements $RequestSearchHistoryPointCopyWith<$Res> {
  _$RequestSearchHistoryPointCopyWithImpl(this._value, this._then);

  final RequestSearchHistoryPoint _value;
  // ignore: unused_field
  final $Res Function(RequestSearchHistoryPoint) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? search = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
    Object? type = freezed,
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
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      start_date: start_date == freezed
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      end_date: end_date == freezed
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestSearchHistoryPointCopyWith<$Res>
    implements $RequestSearchHistoryPointCopyWith<$Res> {
  factory _$RequestSearchHistoryPointCopyWith(_RequestSearchHistoryPoint value,
          $Res Function(_RequestSearchHistoryPoint) then) =
      __$RequestSearchHistoryPointCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date,
      String? type});
}

/// @nodoc
class __$RequestSearchHistoryPointCopyWithImpl<$Res>
    extends _$RequestSearchHistoryPointCopyWithImpl<$Res>
    implements _$RequestSearchHistoryPointCopyWith<$Res> {
  __$RequestSearchHistoryPointCopyWithImpl(_RequestSearchHistoryPoint _value,
      $Res Function(_RequestSearchHistoryPoint) _then)
      : super(_value, (v) => _then(v as _RequestSearchHistoryPoint));

  @override
  _RequestSearchHistoryPoint get _value =>
      super._value as _RequestSearchHistoryPoint;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? search = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
    Object? type = freezed,
  }) {
    return _then(_RequestSearchHistoryPoint(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      start_date: start_date == freezed
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      end_date: end_date == freezed
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestSearchHistoryPoint extends _RequestSearchHistoryPoint {
  _$_RequestSearchHistoryPoint(
      {this.limit,
      this.page,
      this.search,
      this.start_date,
      this.end_date,
      this.type})
      : super._();

  factory _$_RequestSearchHistoryPoint.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestSearchHistoryPointFromJson(json);

  @override
  final int? limit;
  @override
  final int? page;
  @override
  final String? search;
  @override
  final String? start_date;
  @override
  final String? end_date;
  @override
  final String? type;

  @override
  String toString() {
    return 'RequestSearchHistoryPoint(limit: $limit, page: $page, search: $search, start_date: $start_date, end_date: $end_date, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestSearchHistoryPoint &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.search, search) ||
                const DeepCollectionEquality().equals(other.search, search)) &&
            (identical(other.start_date, start_date) ||
                const DeepCollectionEquality()
                    .equals(other.start_date, start_date)) &&
            (identical(other.end_date, end_date) ||
                const DeepCollectionEquality()
                    .equals(other.end_date, end_date)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(search) ^
      const DeepCollectionEquality().hash(start_date) ^
      const DeepCollectionEquality().hash(end_date) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$RequestSearchHistoryPointCopyWith<_RequestSearchHistoryPoint>
      get copyWith =>
          __$RequestSearchHistoryPointCopyWithImpl<_RequestSearchHistoryPoint>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestSearchHistoryPointToJson(this);
  }
}

abstract class _RequestSearchHistoryPoint extends RequestSearchHistoryPoint {
  factory _RequestSearchHistoryPoint(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date,
      String? type}) = _$_RequestSearchHistoryPoint;
  _RequestSearchHistoryPoint._() : super._();

  factory _RequestSearchHistoryPoint.fromJson(Map<String, dynamic> json) =
      _$_RequestSearchHistoryPoint.fromJson;

  @override
  int? get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  String? get search => throw _privateConstructorUsedError;
  @override
  String? get start_date => throw _privateConstructorUsedError;
  @override
  String? get end_date => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestSearchHistoryPointCopyWith<_RequestSearchHistoryPoint>
      get copyWith => throw _privateConstructorUsedError;
}
