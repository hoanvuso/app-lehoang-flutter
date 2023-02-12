// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_forgot_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestForgotPass _$RequestForgotPassFromJson(Map<String, dynamic> json) {
  return _RequestForgotPass.fromJson(json);
}

/// @nodoc
class _$RequestForgotPassTearOff {
  const _$RequestForgotPassTearOff();

  _RequestForgotPass call({String? username}) {
    return _RequestForgotPass(
      username: username,
    );
  }

  RequestForgotPass fromJson(Map<String, Object> json) {
    return RequestForgotPass.fromJson(json);
  }
}

/// @nodoc
const $RequestForgotPass = _$RequestForgotPassTearOff();

/// @nodoc
mixin _$RequestForgotPass {
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestForgotPassCopyWith<RequestForgotPass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestForgotPassCopyWith<$Res> {
  factory $RequestForgotPassCopyWith(
          RequestForgotPass value, $Res Function(RequestForgotPass) then) =
      _$RequestForgotPassCopyWithImpl<$Res>;
  $Res call({String? username});
}

/// @nodoc
class _$RequestForgotPassCopyWithImpl<$Res>
    implements $RequestForgotPassCopyWith<$Res> {
  _$RequestForgotPassCopyWithImpl(this._value, this._then);

  final RequestForgotPass _value;
  // ignore: unused_field
  final $Res Function(RequestForgotPass) _then;

  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestForgotPassCopyWith<$Res>
    implements $RequestForgotPassCopyWith<$Res> {
  factory _$RequestForgotPassCopyWith(
          _RequestForgotPass value, $Res Function(_RequestForgotPass) then) =
      __$RequestForgotPassCopyWithImpl<$Res>;
  @override
  $Res call({String? username});
}

/// @nodoc
class __$RequestForgotPassCopyWithImpl<$Res>
    extends _$RequestForgotPassCopyWithImpl<$Res>
    implements _$RequestForgotPassCopyWith<$Res> {
  __$RequestForgotPassCopyWithImpl(
      _RequestForgotPass _value, $Res Function(_RequestForgotPass) _then)
      : super(_value, (v) => _then(v as _RequestForgotPass));

  @override
  _RequestForgotPass get _value => super._value as _RequestForgotPass;

  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_RequestForgotPass(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestForgotPass implements _RequestForgotPass {
  _$_RequestForgotPass({this.username});

  factory _$_RequestForgotPass.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestForgotPassFromJson(json);

  @override
  final String? username;

  @override
  String toString() {
    return 'RequestForgotPass(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestForgotPass &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$RequestForgotPassCopyWith<_RequestForgotPass> get copyWith =>
      __$RequestForgotPassCopyWithImpl<_RequestForgotPass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestForgotPassToJson(this);
  }
}

abstract class _RequestForgotPass implements RequestForgotPass {
  factory _RequestForgotPass({String? username}) = _$_RequestForgotPass;

  factory _RequestForgotPass.fromJson(Map<String, dynamic> json) =
      _$_RequestForgotPass.fromJson;

  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestForgotPassCopyWith<_RequestForgotPass> get copyWith =>
      throw _privateConstructorUsedError;
}
