// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_change_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestChangePassword _$RequestChangePasswordFromJson(
    Map<String, dynamic> json) {
  return _RequestChangePassword.fromJson(json);
}

/// @nodoc
class _$RequestChangePasswordTearOff {
  const _$RequestChangePasswordTearOff();

  _RequestChangePassword call(
      {String? old_password, String? password_confirmation, String? password}) {
    return _RequestChangePassword(
      old_password: old_password,
      password_confirmation: password_confirmation,
      password: password,
    );
  }

  RequestChangePassword fromJson(Map<String, Object> json) {
    return RequestChangePassword.fromJson(json);
  }
}

/// @nodoc
const $RequestChangePassword = _$RequestChangePasswordTearOff();

/// @nodoc
mixin _$RequestChangePassword {
  String? get old_password => throw _privateConstructorUsedError;
  String? get password_confirmation => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestChangePasswordCopyWith<RequestChangePassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestChangePasswordCopyWith<$Res> {
  factory $RequestChangePasswordCopyWith(RequestChangePassword value,
          $Res Function(RequestChangePassword) then) =
      _$RequestChangePasswordCopyWithImpl<$Res>;
  $Res call(
      {String? old_password, String? password_confirmation, String? password});
}

/// @nodoc
class _$RequestChangePasswordCopyWithImpl<$Res>
    implements $RequestChangePasswordCopyWith<$Res> {
  _$RequestChangePasswordCopyWithImpl(this._value, this._then);

  final RequestChangePassword _value;
  // ignore: unused_field
  final $Res Function(RequestChangePassword) _then;

  @override
  $Res call({
    Object? old_password = freezed,
    Object? password_confirmation = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      old_password: old_password == freezed
          ? _value.old_password
          : old_password // ignore: cast_nullable_to_non_nullable
              as String?,
      password_confirmation: password_confirmation == freezed
          ? _value.password_confirmation
          : password_confirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestChangePasswordCopyWith<$Res>
    implements $RequestChangePasswordCopyWith<$Res> {
  factory _$RequestChangePasswordCopyWith(_RequestChangePassword value,
          $Res Function(_RequestChangePassword) then) =
      __$RequestChangePasswordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? old_password, String? password_confirmation, String? password});
}

/// @nodoc
class __$RequestChangePasswordCopyWithImpl<$Res>
    extends _$RequestChangePasswordCopyWithImpl<$Res>
    implements _$RequestChangePasswordCopyWith<$Res> {
  __$RequestChangePasswordCopyWithImpl(_RequestChangePassword _value,
      $Res Function(_RequestChangePassword) _then)
      : super(_value, (v) => _then(v as _RequestChangePassword));

  @override
  _RequestChangePassword get _value => super._value as _RequestChangePassword;

  @override
  $Res call({
    Object? old_password = freezed,
    Object? password_confirmation = freezed,
    Object? password = freezed,
  }) {
    return _then(_RequestChangePassword(
      old_password: old_password == freezed
          ? _value.old_password
          : old_password // ignore: cast_nullable_to_non_nullable
              as String?,
      password_confirmation: password_confirmation == freezed
          ? _value.password_confirmation
          : password_confirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestChangePassword implements _RequestChangePassword {
  _$_RequestChangePassword(
      {this.old_password, this.password_confirmation, this.password});

  factory _$_RequestChangePassword.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestChangePasswordFromJson(json);

  @override
  final String? old_password;
  @override
  final String? password_confirmation;
  @override
  final String? password;

  @override
  String toString() {
    return 'RequestChangePassword(old_password: $old_password, password_confirmation: $password_confirmation, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestChangePassword &&
            (identical(other.old_password, old_password) ||
                const DeepCollectionEquality()
                    .equals(other.old_password, old_password)) &&
            (identical(other.password_confirmation, password_confirmation) ||
                const DeepCollectionEquality().equals(
                    other.password_confirmation, password_confirmation)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(old_password) ^
      const DeepCollectionEquality().hash(password_confirmation) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$RequestChangePasswordCopyWith<_RequestChangePassword> get copyWith =>
      __$RequestChangePasswordCopyWithImpl<_RequestChangePassword>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestChangePasswordToJson(this);
  }
}

abstract class _RequestChangePassword implements RequestChangePassword {
  factory _RequestChangePassword(
      {String? old_password,
      String? password_confirmation,
      String? password}) = _$_RequestChangePassword;

  factory _RequestChangePassword.fromJson(Map<String, dynamic> json) =
      _$_RequestChangePassword.fromJson;

  @override
  String? get old_password => throw _privateConstructorUsedError;
  @override
  String? get password_confirmation => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestChangePasswordCopyWith<_RequestChangePassword> get copyWith =>
      throw _privateConstructorUsedError;
}
