// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewObject _$_$_NewObjectFromJson(Map<String, dynamic> json) {
  return _$_NewObject(
    image: json['image'],
    updated_at: json['updated_at'],
    image_path: json['image_path'],
    ordering: json['ordering'] as int?,
    image_url: json['image_url'] as String?,
    name: json['name'] as String?,
    created_at: json['created_at'] as String?,
    id: json['id'] as int?,
    short_body: json['short_body'] as String?,
    body: json['body'] as String?,
    type: json['type'] as String?,
    was_read_count: json['was_read_count'] as int?,
  );
}

Map<String, dynamic> _$_$_NewObjectToJson(_$_NewObject instance) =>
    <String, dynamic>{
      'image': instance.image,
      'updated_at': instance.updated_at,
      'image_path': instance.image_path,
      'ordering': instance.ordering,
      'image_url': instance.image_url,
      'name': instance.name,
      'created_at': instance.created_at,
      'id': instance.id,
      'short_body': instance.short_body,
      'body': instance.body,
      'type': instance.type,
      'was_read_count': instance.was_read_count,
    };
