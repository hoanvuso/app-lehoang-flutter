// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_verify_otp_forgot_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestVerifyOtpForgotPass _$RequestVerifyOtpForgotPassFromJson(
    Map<String, dynamic> json) {
  return _RequestVerifyOtpForgotPass.fromJson(json);
}

/// @nodoc
class _$RequestVerifyOtpForgotPassTearOff {
  const _$RequestVerifyOtpForgotPassTearOff();

  _RequestVerifyOtpForgotPass call({String? username, String? token}) {
    return _RequestVerifyOtpForgotPass(
      username: username,
      token: token,
    );
  }

  RequestVerifyOtpForgotPass fromJson(Map<String, Object> json) {
    return RequestVerifyOtpForgotPass.fromJson(json);
  }
}

/// @nodoc
const $RequestVerifyOtpForgotPass = _$RequestVerifyOtpForgotPassTearOff();

/// @nodoc
mixin _$RequestVerifyOtpForgotPass {
  String? get username => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestVerifyOtpForgotPassCopyWith<RequestVerifyOtpForgotPass>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestVerifyOtpForgotPassCopyWith<$Res> {
  factory $RequestVerifyOtpForgotPassCopyWith(RequestVerifyOtpForgotPass value,
          $Res Function(RequestVerifyOtpForgotPass) then) =
      _$RequestVerifyOtpForgotPassCopyWithImpl<$Res>;
  $Res call({String? username, String? token});
}

/// @nodoc
class _$RequestVerifyOtpForgotPassCopyWithImpl<$Res>
    implements $RequestVerifyOtpForgotPassCopyWith<$Res> {
  _$RequestVerifyOtpForgotPassCopyWithImpl(this._value, this._then);

  final RequestVerifyOtpForgotPass _value;
  // ignore: unused_field
  final $Res Function(RequestVerifyOtpForgotPass) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestVerifyOtpForgotPassCopyWith<$Res>
    implements $RequestVerifyOtpForgotPassCopyWith<$Res> {
  factory _$RequestVerifyOtpForgotPassCopyWith(
          _RequestVerifyOtpForgotPass value,
          $Res Function(_RequestVerifyOtpForgotPass) then) =
      __$RequestVerifyOtpForgotPassCopyWithImpl<$Res>;
  @override
  $Res call({String? username, String? token});
}

/// @nodoc
class __$RequestVerifyOtpForgotPassCopyWithImpl<$Res>
    extends _$RequestVerifyOtpForgotPassCopyWithImpl<$Res>
    implements _$RequestVerifyOtpForgotPassCopyWith<$Res> {
  __$RequestVerifyOtpForgotPassCopyWithImpl(_RequestVerifyOtpForgotPass _value,
      $Res Function(_RequestVerifyOtpForgotPass) _then)
      : super(_value, (v) => _then(v as _RequestVerifyOtpForgotPass));

  @override
  _RequestVerifyOtpForgotPass get _value =>
      super._value as _RequestVerifyOtpForgotPass;

  @override
  $Res call({
    Object? username = freezed,
    Object? token = freezed,
  }) {
    return _then(_RequestVerifyOtpForgotPass(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestVerifyOtpForgotPass implements _RequestVerifyOtpForgotPass {
  _$_RequestVerifyOtpForgotPass({this.username, this.token});

  factory _$_RequestVerifyOtpForgotPass.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestVerifyOtpForgotPassFromJson(json);

  @override
  final String? username;
  @override
  final String? token;

  @override
  String toString() {
    return 'RequestVerifyOtpForgotPass(username: $username, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestVerifyOtpForgotPass &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$RequestVerifyOtpForgotPassCopyWith<_RequestVerifyOtpForgotPass>
      get copyWith => __$RequestVerifyOtpForgotPassCopyWithImpl<
          _RequestVerifyOtpForgotPass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestVerifyOtpForgotPassToJson(this);
  }
}

abstract class _RequestVerifyOtpForgotPass
    implements RequestVerifyOtpForgotPass {
  factory _RequestVerifyOtpForgotPass({String? username, String? token}) =
      _$_RequestVerifyOtpForgotPass;

  factory _RequestVerifyOtpForgotPass.fromJson(Map<String, dynamic> json) =
      _$_RequestVerifyOtpForgotPass.fromJson;

  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestVerifyOtpForgotPassCopyWith<_RequestVerifyOtpForgotPass>
      get copyWith => throw _privateConstructorUsedError;
}
