// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_verify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestVerify _$_$_RequestVerifyFromJson(Map<String, dynamic> json) {
  return _$_RequestVerify(
    device_token: json['device_token'] as String?,
    device_type: json['device_type'] as String?,
    verify_code: json['verify_code'] as String?,
    username: json['username'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestVerifyToJson(_$_RequestVerify instance) =>
    <String, dynamic>{
      'device_token': instance.device_token,
      'device_type': instance.device_type,
      'verify_code': instance.verify_code,
      'username': instance.username,
    };
