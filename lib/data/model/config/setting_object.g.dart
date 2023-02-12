// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingObject _$_$_SettingObjectFromJson(Map<String, dynamic> json) {
  return _$_SettingObject(
    updated_at: json['updated_at'],
    created_at: json['created_at'],
    id: json['id'] as int?,
    value: json['value'] as String?,
    key: json['key'] as String?,
    group: json['group'] as String?,
  );
}

Map<String, dynamic> _$_$_SettingObjectToJson(_$_SettingObject instance) =>
    <String, dynamic>{
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'id': instance.id,
      'value': instance.value,
      'key': instance.key,
      'group': instance.group,
    };
