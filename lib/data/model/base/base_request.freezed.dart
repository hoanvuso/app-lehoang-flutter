// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'base_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseRequest _$BaseRequestFromJson(Map<String, dynamic> json) {
  return _BaseRequest.fromJson(json);
}

/// @nodoc
class _$BaseRequestTearOff {
  const _$BaseRequestTearOff();

  _BaseRequest call({int? limit, int? page, String? search}) {
    return _BaseRequest(
      limit: limit,
      page: page,
      search: search,
    );
  }

  BaseRequest fromJson(Map<String, Object> json) {
    return BaseRequest.fromJson(json);
  }
}

/// @nodoc
const $BaseRequest = _$BaseRequestTearOff();

/// @nodoc
mixin _$BaseRequest {
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseRequestCopyWith<BaseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseRequestCopyWith<$Res> {
  factory $BaseRequestCopyWith(
          BaseRequest value, $Res Function(BaseRequest) then) =
      _$BaseRequestCopyWithImpl<$Res>;
  $Res call({int? limit, int? page, String? search});
}

/// @nodoc
class _$BaseRequestCopyWithImpl<$Res> implements $BaseRequestCopyWith<$Res> {
  _$BaseRequestCopyWithImpl(this._value, this._then);

  final BaseRequest _value;
  // ignore: unused_field
  final $Res Function(BaseRequest) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? search = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$BaseRequestCopyWith<$Res>
    implements $BaseRequestCopyWith<$Res> {
  factory _$BaseRequestCopyWith(
          _BaseRequest value, $Res Function(_BaseRequest) then) =
      __$BaseRequestCopyWithImpl<$Res>;
  @override
  $Res call({int? limit, int? page, String? search});
}

/// @nodoc
class __$BaseRequestCopyWithImpl<$Res> extends _$BaseRequestCopyWithImpl<$Res>
    implements _$BaseRequestCopyWith<$Res> {
  __$BaseRequestCopyWithImpl(
      _BaseRequest _value, $Res Function(_BaseRequest) _then)
      : super(_value, (v) => _then(v as _BaseRequest));

  @override
  _BaseRequest get _value => super._value as _BaseRequest;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? search = freezed,
  }) {
    return _then(_BaseRequest(
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
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BaseRequest with DiagnosticableTreeMixin implements _BaseRequest {
  _$_BaseRequest({this.limit, this.page, this.search});

  factory _$_BaseRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_BaseRequestFromJson(json);

  @override
  final int? limit;
  @override
  final int? page;
  @override
  final String? search;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BaseRequest(limit: $limit, page: $page, search: $search)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BaseRequest'))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('search', search));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BaseRequest &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.search, search) ||
                const DeepCollectionEquality().equals(other.search, search)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(search);

  @JsonKey(ignore: true)
  @override
  _$BaseRequestCopyWith<_BaseRequest> get copyWith =>
      __$BaseRequestCopyWithImpl<_BaseRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BaseRequestToJson(this);
  }
}

abstract class _BaseRequest implements BaseRequest {
  factory _BaseRequest({int? limit, int? page, String? search}) =
      _$_BaseRequest;

  factory _BaseRequest.fromJson(Map<String, dynamic> json) =
      _$_BaseRequest.fromJson;

  @override
  int? get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  String? get search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BaseRequestCopyWith<_BaseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
