// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$_$_ContactFromJson(Map<String, dynamic> json) {
  return _$_Contact(
    youtube: json['youtube'] as String?,
    regions: json['regions'] as String?,
    name: json['name'] as String?,
    updated_at: json['updated_at'],
    facebook: json['facebook'] as String?,
    created_at: json['created_at'],
    descriptions: json['descriptions'] as String?,
    id: json['id'] as int?,
    hot_line: json['hot_line'] as String?,
    email: json['email'] as String?,
  );
}

Map<String, dynamic> _$_$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'youtube': instance.youtube,
      'regions': instance.regions,
      'name': instance.name,
      'updated_at': instance.updated_at,
      'facebook': instance.facebook,
      'created_at': instance.created_at,
      'descriptions': instance.descriptions,
      'id': instance.id,
      'hot_line': instance.hot_line,
      'email': instance.email,
    };
