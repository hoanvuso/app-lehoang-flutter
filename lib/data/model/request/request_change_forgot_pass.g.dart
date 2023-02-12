// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_change_forgot_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestChangeForgotPass _$_$_RequestChangeForgotPassFromJson(
    Map<String, dynamic> json) {
  return _$_RequestChangeForgotPass(
    deviceType: json['deviceType'] as String?,
    password: json['password'] as String?,
    password_confirmation: json['password_confirmation'] as String?,
    username: json['username'] as String?,
    token: json['token'] as String?,
    deviceToken: json['deviceToken'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestChangeForgotPassToJson(
        _$_RequestChangeForgotPass instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
      'username': instance.username,
      'token': instance.token,
      'deviceToken': instance.deviceToken,
    };
