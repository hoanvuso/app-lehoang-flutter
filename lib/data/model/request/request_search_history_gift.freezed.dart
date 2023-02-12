// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_search_history_gift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestSearchHistoryGift _$RequestSearchHistoryGiftFromJson(
    Map<String, dynamic> json) {
  return _RequestSearchHistoryGift.fromJson(json);
}

/// @nodoc
class _$RequestSearchHistoryGiftTearOff {
  const _$RequestSearchHistoryGiftTearOff();

  _RequestSearchHistoryGift call(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date}) {
    return _RequestSearchHistoryGift(
      limit: limit,
      page: page,
      search: search,
      start_date: start_date,
      end_date: end_date,
    );
  }

  RequestSearchHistoryGift fromJson(Map<String, Object> json) {
    return RequestSearchHistoryGift.fromJson(json);
  }
}

/// @nodoc
const $RequestSearchHistoryGift = _$RequestSearchHistoryGiftTearOff();

/// @nodoc
mixin _$RequestSearchHistoryGift {
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get start_date => throw _privateConstructorUsedError;
  String? get end_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestSearchHistoryGiftCopyWith<RequestSearchHistoryGift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSearchHistoryGiftCopyWith<$Res> {
  factory $RequestSearchHistoryGiftCopyWith(RequestSearchHistoryGift value,
          $Res Function(RequestSearchHistoryGift) then) =
      _$RequestSearchHistoryGiftCopyWithImpl<$Res>;
  $Res call(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date});
}

/// @nodoc
class _$RequestSearchHistoryGiftCopyWithImpl<$Res>
    implements $RequestSearchHistoryGiftCopyWith<$Res> {
  _$RequestSearchHistoryGiftCopyWithImpl(this._value, this._then);

  final RequestSearchHistoryGift _value;
  // ignore: unused_field
  final $Res Function(RequestSearchHistoryGift) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? search = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$RequestSearchHistoryGiftCopyWith<$Res>
    implements $RequestSearchHistoryGiftCopyWith<$Res> {
  factory _$RequestSearchHistoryGiftCopyWith(_RequestSearchHistoryGift value,
          $Res Function(_RequestSearchHistoryGift) then) =
      __$RequestSearchHistoryGiftCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date});
}

/// @nodoc
class __$RequestSearchHistoryGiftCopyWithImpl<$Res>
    extends _$RequestSearchHistoryGiftCopyWithImpl<$Res>
    implements _$RequestSearchHistoryGiftCopyWith<$Res> {
  __$RequestSearchHistoryGiftCopyWithImpl(_RequestSearchHistoryGift _value,
      $Res Function(_RequestSearchHistoryGift) _then)
      : super(_value, (v) => _then(v as _RequestSearchHistoryGift));

  @override
  _RequestSearchHistoryGift get _value =>
      super._value as _RequestSearchHistoryGift;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? search = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
  }) {
    return _then(_RequestSearchHistoryGift(
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
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestSearchHistoryGift extends _RequestSearchHistoryGift {
  _$_RequestSearchHistoryGift(
      {this.limit, this.page, this.search, this.start_date, this.end_date})
      : super._();

  factory _$_RequestSearchHistoryGift.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestSearchHistoryGiftFromJson(json);

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
  String toString() {
    return 'RequestSearchHistoryGift(limit: $limit, page: $page, search: $search, start_date: $start_date, end_date: $end_date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestSearchHistoryGift &&
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
                    .equals(other.end_date, end_date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(search) ^
      const DeepCollectionEquality().hash(start_date) ^
      const DeepCollectionEquality().hash(end_date);

  @JsonKey(ignore: true)
  @override
  _$RequestSearchHistoryGiftCopyWith<_RequestSearchHistoryGift> get copyWith =>
      __$RequestSearchHistoryGiftCopyWithImpl<_RequestSearchHistoryGift>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestSearchHistoryGiftToJson(this);
  }
}

abstract class _RequestSearchHistoryGift extends RequestSearchHistoryGift {
  factory _RequestSearchHistoryGift(
      {int? limit,
      int? page,
      String? search,
      String? start_date,
      String? end_date}) = _$_RequestSearchHistoryGift;
  _RequestSearchHistoryGift._() : super._();

  factory _RequestSearchHistoryGift.fromJson(Map<String, dynamic> json) =
      _$_RequestSearchHistoryGift.fromJson;

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
  @JsonKey(ignore: true)
  _$RequestSearchHistoryGiftCopyWith<_RequestSearchHistoryGift> get copyWith =>
      throw _privateConstructorUsedError;
}
