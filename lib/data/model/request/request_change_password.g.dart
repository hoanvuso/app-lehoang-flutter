// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_change_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestChangePassword _$_$_RequestChangePasswordFromJson(
    Map<String, dynamic> json) {
  return _$_RequestChangePassword(
    old_password: json['old_password'] as String?,
    password_confirmation: json['password_confirmation'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestChangePasswordToJson(
        _$_RequestChangePassword instance) =>
    <String, dynamic>{
      'old_password': instance.old_password,
      'password_confirmation': instance.password_confirmation,
      'password': instance.password,
    };
