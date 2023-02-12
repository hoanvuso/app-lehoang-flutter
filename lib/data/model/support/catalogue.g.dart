// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Catalogue _$_$_CatalogueFromJson(Map<String, dynamic> json) {
  return _$_Catalogue(
    is_active: json['is_active'] as int?,
    updated_at: json['updated_at'],
    ordering: json['ordering'] as int?,
    name: json['name'] as String?,
    link: json['link'] as String?,
    created_at: json['created_at'],
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$_$_CatalogueToJson(_$_Catalogue instance) =>
    <String, dynamic>{
      'is_active': instance.is_active,
      'updated_at': instance.updated_at,
      'ordering': instance.ordering,
      'name': instance.name,
      'link': instance.link,
      'created_at': instance.created_at,
      'id': instance.id,
    };
