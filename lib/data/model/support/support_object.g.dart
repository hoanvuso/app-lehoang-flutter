// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportObject _$_$_SupportObjectFromJson(Map<String, dynamic> json) {
  return _$_SupportObject(
    image: json['image'],
    image_url: json['image_url'] as String?,
    document_file: json['document_file'] as String?,
    created_at: json['created_at'] as String?,
    short_body: json['short_body'],
    body: json['body'] as String?,
    type: json['type'] as String?,
    updated_at: json['updated_at'],
    content_type: json['content_type'],
    image_path: json['image_path'],
    name: json['name'] as String?,
    id: json['id'] as int?,
    slug: json['slug'] as String?,
    list_images: (json['list_images'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_SupportObjectToJson(_$_SupportObject instance) =>
    <String, dynamic>{
      'image': instance.image,
      'image_url': instance.image_url,
      'document_file': instance.document_file,
      'created_at': instance.created_at,
      'short_body': instance.short_body,
      'body': instance.body,
      'type': instance.type,
      'updated_at': instance.updated_at,
      'content_type': instance.content_type,
      'image_path': instance.image_path,
      'name': instance.name,
      'id': instance.id,
      'slug': instance.slug,
      'list_images': instance.list_images,
    };
