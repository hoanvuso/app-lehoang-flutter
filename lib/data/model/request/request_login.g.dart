// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestLogin _$_$_RequestLoginFromJson(Map<String, dynamic> json) {
  return _$_RequestLogin(
    deviceType: json['deviceType'] as String?,
    password: json['password'] as String?,
    username: json['username'] as String?,
    deviceToken: json['deviceToken'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestLoginToJson(_$_RequestLogin instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'password': instance.password,
      'username': instance.username,
      'deviceToken': instance.deviceToken,
    };
