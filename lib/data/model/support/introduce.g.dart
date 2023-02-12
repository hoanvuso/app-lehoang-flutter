// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introduce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Introduce _$_$_IntroduceFromJson(Map<String, dynamic> json) {
  return _$_Introduce(
    image: json['image'] as String?,
    image_url: json['image_url'] as String?,
    created_at: json['created_at'] as String?,
    short_body: json['short_body'] as String?,
    body: json['body'] as String?,
    type: json['type'],
    updated_at: json['updated_at'] as String?,
    content_type: json['content_type'] as String?,
    image_path: json['image_path'] as String?,
    name: json['name'] as String?,
    id: json['id'] as int?,
    document_file: json['document_file'],
    slug: json['slug'] as String?,
  );
}

Map<String, dynamic> _$_$_IntroduceToJson(_$_Introduce instance) =>
    <String, dynamic>{
      'image': instance.image,
      'image_url': instance.image_url,
      'created_at': instance.created_at,
      'short_body': instance.short_body,
      'body': instance.body,
      'type': instance.type,
      'updated_at': instance.updated_at,
      'content_type': instance.content_type,
      'image_path': instance.image_path,
      'name': instance.name,
      'id': instance.id,
      'document_file': instance.document_file,
      'slug': instance.slug,
    };
