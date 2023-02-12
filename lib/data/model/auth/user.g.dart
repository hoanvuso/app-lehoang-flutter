// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    address: json['address'] as String?,
    role: json['role'] as String?,
    is_active: json['is_active'] as int?,
    total_gift: json['total_gift'] as int?,
    avatarUrl: json['avatarUrl'] as String?,
    recent_point: json['recent_point'] as int?,
    created_at: json['created_at'] as String?,
    email_verified_at: json['email_verified_at'],
    avatar: json['avatar'],
    earning_point: json['earning_point'] as int?,
    token: json['token'] as String?,
    reference: json['reference'] as String?,
    updated_at: json['updated_at'] as String?,
    rank: json['rank'] as String?,
    password_change: json['password_change'],
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    birthday: json['birthday'] as String?,
    username: json['username'] as String?,
    agency_name: json['agency_name'] as String?,
    point_exchane: json['point_exchane'] as int?,
    total_scan: json['total_scan'] as int?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'address': instance.address,
      'role': instance.role,
      'is_active': instance.is_active,
      'total_gift': instance.total_gift,
      'avatarUrl': instance.avatarUrl,
      'recent_point': instance.recent_point,
      'created_at': instance.created_at,
      'email_verified_at': instance.email_verified_at,
      'avatar': instance.avatar,
      'earning_point': instance.earning_point,
      'token': instance.token,
      'reference': instance.reference,
      'updated_at': instance.updated_at,
      'rank': instance.rank,
      'password_change': instance.password_change,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'birthday': instance.birthday,
      'username': instance.username,
      'agency_name': instance.agency_name,
      'point_exchane': instance.point_exchane,
      'total_scan': instance.total_scan,
    };
