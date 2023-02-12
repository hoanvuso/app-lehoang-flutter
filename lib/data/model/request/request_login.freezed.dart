// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestLogin _$RequestLoginFromJson(Map<String, dynamic> json) {
  return _RequestLogin.fromJson(json);
}

/// @nodoc
class _$RequestLoginTearOff {
  const _$RequestLoginTearOff();

  _RequestLogin call(
      {String? deviceType,
      String? password,
      String? username,
      String? deviceToken}) {
    return _RequestLogin(
      deviceType: deviceType,
      password: password,
      username: username,
      deviceToken: deviceToken,
    );
  }

  RequestLogin fromJson(Map<String, Object> json) {
    return RequestLogin.fromJson(json);
  }
}

/// @nodoc
const $RequestLogin = _$RequestLoginTearOff();

/// @nodoc
mixin _$RequestLogin {
  String? get deviceType => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get deviceToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestLoginCopyWith<RequestLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestLoginCopyWith<$Res> {
  factory $RequestLoginCopyWith(
          RequestLogin value, $Res Function(RequestLogin) then) =
      _$RequestLoginCopyWithImpl<$Res>;
  $Res call(
      {String? deviceType,
      String? password,
      String? username,
      String? deviceToken});
}

/// @nodoc
class _$RequestLoginCopyWithImpl<$Res> implements $RequestLoginCopyWith<$Res> {
  _$RequestLoginCopyWithImpl(this._value, this._then);

  final RequestLogin _value;
  // ignore: unused_field
  final $Res Function(RequestLogin) _then;

  @override
  $Res call({
    Object? deviceType = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? deviceToken = freezed,
  }) {
    return _then(_value.copyWith(
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: deviceToken == freezed
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestLoginCopyWith<$Res>
    implements $RequestLoginCopyWith<$Res> {
  factory _$RequestLoginCopyWith(
          _RequestLogin value, $Res Function(_RequestLogin) then) =
      __$RequestLoginCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? deviceType,
      String? password,
      String? username,
      String? deviceToken});
}

/// @nodoc
class __$RequestLoginCopyWithImpl<$Res> extends _$RequestLoginCopyWithImpl<$Res>
    implements _$RequestLoginCopyWith<$Res> {
  __$RequestLoginCopyWithImpl(
      _RequestLogin _value, $Res Function(_RequestLogin) _then)
      : super(_value, (v) => _then(v as _RequestLogin));

  @override
  _RequestLogin get _value => super._value as _RequestLogin;

  @override
  $Res call({
    Object? deviceType = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? deviceToken = freezed,
  }) {
    return _then(_RequestLogin(
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: deviceToken == freezed
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestLogin implements _RequestLogin {
  _$_RequestLogin(
      {this.deviceType, this.password, this.username, this.deviceToken});

  factory _$_RequestLogin.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestLoginFromJson(json);

  @override
  final String? deviceType;
  @override
  final String? password;
  @override
  final String? username;
  @override
  final String? deviceToken;

  @override
  String toString() {
    return 'RequestLogin(deviceType: $deviceType, password: $password, username: $username, deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestLogin &&
            (identical(other.deviceType, deviceType) ||
                const DeepCollectionEquality()
                    .equals(other.deviceType, deviceType)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.deviceToken, deviceToken) ||
                const DeepCollectionEquality()
                    .equals(other.deviceToken, deviceToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deviceType) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(deviceToken);

  @JsonKey(ignore: true)
  @override
  _$RequestLoginCopyWith<_RequestLogin> get copyWith =>
      __$RequestLoginCopyWithImpl<_RequestLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestLoginToJson(this);
  }
}

abstract class _RequestLogin implements RequestLogin {
  factory _RequestLogin(
      {String? deviceType,
      String? password,
      String? username,
      String? deviceToken}) = _$_RequestLogin;

  factory _RequestLogin.fromJson(Map<String, dynamic> json) =
      _$_RequestLogin.fromJson;

  @override
  String? get deviceType => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get deviceToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestLoginCopyWith<_RequestLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
