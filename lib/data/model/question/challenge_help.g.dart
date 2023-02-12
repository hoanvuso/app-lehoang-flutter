// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_help.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChallengeHelp _$_$_ChallengeHelpFromJson(Map<String, dynamic> json) {
  return _$_ChallengeHelp(
    image: json['image'],
    image_url: json['image_url'] as String?,
    created_at: json['created_at'],
    short_body: json['short_body'],
    body: json['body'] as String?,
    type: json['type'] as String?,
    updated_at: json['updated_at'],
    content_type: json['content_type'],
    image_path: json['image_path'],
    name: json['name'] as String?,
    id: json['id'] as int?,
    document_file: json['document_file'],
    slug: json['slug'] as String?,
  );
}

Map<String, dynamic> _$_$_ChallengeHelpToJson(_$_ChallengeHelp instance) =>
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
