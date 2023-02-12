// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_update_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestUpdateProfile _$_$_RequestUpdateProfileFromJson(
    Map<String, dynamic> json) {
  return _$_RequestUpdateProfile(
    birthday: json['birthday'] as String?,
    agency_name: json['agency_name'] as String?,
    address: json['address'] as String?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestUpdateProfileToJson(
        _$_RequestUpdateProfile instance) =>
    <String, dynamic>{
      'birthday': instance.birthday,
      'agency_name': instance.agency_name,
      'address': instance.address,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };
