// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestVerify _$RequestVerifyFromJson(Map<String, dynamic> json) {
  return _RequestVerify.fromJson(json);
}

/// @nodoc
class _$RequestVerifyTearOff {
  const _$RequestVerifyTearOff();

  _RequestVerify call(
      {String? device_token,
      String? device_type,
      String? verify_code,
      String? username}) {
    return _RequestVerify(
      device_token: device_token,
      device_type: device_type,
      verify_code: verify_code,
      username: username,
    );
  }

  RequestVerify fromJson(Map<String, Object> json) {
    return RequestVerify.fromJson(json);
  }
}

/// @nodoc
const $RequestVerify = _$RequestVerifyTearOff();

/// @nodoc
mixin _$RequestVerify {
  String? get device_token => throw _privateConstructorUsedError;
  String? get device_type => throw _privateConstructorUsedError;
  String? get verify_code => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestVerifyCopyWith<RequestVerify> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestVerifyCopyWith<$Res> {
  factory $RequestVerifyCopyWith(
          RequestVerify value, $Res Function(RequestVerify) then) =
      _$RequestVerifyCopyWithImpl<$Res>;
  $Res call(
      {String? device_token,
      String? device_type,
      String? verify_code,
      String? username});
}

/// @nodoc
class _$RequestVerifyCopyWithImpl<$Res>
    implements $RequestVerifyCopyWith<$Res> {
  _$RequestVerifyCopyWithImpl(this._value, this._then);

  final RequestVerify _value;
  // ignore: unused_field
  final $Res Function(RequestVerify) _then;

  @override
  $Res call({
    Object? device_token = freezed,
    Object? device_type = freezed,
    Object? verify_code = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      device_token: device_token == freezed
          ? _value.device_token
          : device_token // ignore: cast_nullable_to_non_nullable
              as String?,
      device_type: device_type == freezed
          ? _value.device_type
          : device_type // ignore: cast_nullable_to_non_nullable
              as String?,
      verify_code: verify_code == freezed
          ? _value.verify_code
          : verify_code // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestVerifyCopyWith<$Res>
    implements $RequestVerifyCopyWith<$Res> {
  factory _$RequestVerifyCopyWith(
          _RequestVerify value, $Res Function(_RequestVerify) then) =
      __$RequestVerifyCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? device_token,
      String? device_type,
      String? verify_code,
      String? username});
}

/// @nodoc
class __$RequestVerifyCopyWithImpl<$Res>
    extends _$RequestVerifyCopyWithImpl<$Res>
    implements _$RequestVerifyCopyWith<$Res> {
  __$RequestVerifyCopyWithImpl(
      _RequestVerify _value, $Res Function(_RequestVerify) _then)
      : super(_value, (v) => _then(v as _RequestVerify));

  @override
  _RequestVerify get _value => super._value as _RequestVerify;

  @override
  $Res call({
    Object? device_token = freezed,
    Object? device_type = freezed,
    Object? verify_code = freezed,
    Object? username = freezed,
  }) {
    return _then(_RequestVerify(
      device_token: device_token == freezed
          ? _value.device_token
          : device_token // ignore: cast_nullable_to_non_nullable
              as String?,
      device_type: device_type == freezed
          ? _value.device_type
          : device_type // ignore: cast_nullable_to_non_nullable
              as String?,
      verify_code: verify_code == freezed
          ? _value.verify_code
          : verify_code // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestVerify implements _RequestVerify {
  _$_RequestVerify(
      {this.device_token, this.device_type, this.verify_code, this.username});

  factory _$_RequestVerify.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestVerifyFromJson(json);

  @override
  final String? device_token;
  @override
  final String? device_type;
  @override
  final String? verify_code;
  @override
  final String? username;

  @override
  String toString() {
    return 'RequestVerify(device_token: $device_token, device_type: $device_type, verify_code: $verify_code, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestVerify &&
            (identical(other.device_token, device_token) ||
                const DeepCollectionEquality()
                    .equals(other.device_token, device_token)) &&
            (identical(other.device_type, device_type) ||
                const DeepCollectionEquality()
                    .equals(other.device_type, device_type)) &&
            (identical(other.verify_code, verify_code) ||
                const DeepCollectionEquality()
                    .equals(other.verify_code, verify_code)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(device_token) ^
      const DeepCollectionEquality().hash(device_type) ^
      const DeepCollectionEquality().hash(verify_code) ^
      const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$RequestVerifyCopyWith<_RequestVerify> get copyWith =>
      __$RequestVerifyCopyWithImpl<_RequestVerify>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestVerifyToJson(this);
  }
}

abstract class _RequestVerify implements RequestVerify {
  factory _RequestVerify(
      {String? device_token,
      String? device_type,
      String? verify_code,
      String? username}) = _$_RequestVerify;

  factory _RequestVerify.fromJson(Map<String, dynamic> json) =
      _$_RequestVerify.fromJson;

  @override
  String? get device_token => throw _privateConstructorUsedError;
  @override
  String? get device_type => throw _privateConstructorUsedError;
  @override
  String? get verify_code => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestVerifyCopyWith<_RequestVerify> get copyWith =>
      throw _privateConstructorUsedError;
}
