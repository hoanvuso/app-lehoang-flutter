// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catologue_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CatologueImage _$_$_CatologueImageFromJson(Map<String, dynamic> json) {
  return _$_CatologueImage(
    image: json['image'],
    catalogue_id: json['catalogue_id'] as int?,
    updated_at: json['updated_at'],
    ordering: json['ordering'] as int?,
    image_url: json['image_url'] as String?,
    name: json['name'] as String?,
    created_at: json['created_at'],
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$_$_CatologueImageToJson(_$_CatologueImage instance) =>
    <String, dynamic>{
      'image': instance.image,
      'catalogue_id': instance.catalogue_id,
      'updated_at': instance.updated_at,
      'ordering': instance.ordering,
      'image_url': instance.image_url,
      'name': instance.name,
      'created_at': instance.created_at,
      'id': instance.id,
    };
