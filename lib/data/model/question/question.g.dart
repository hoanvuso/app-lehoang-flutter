// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$_$_QuestionFromJson(Map<String, dynamic> json) {
  return _$_Question(
    image: json['image'],
    is_deleted: json['is_deleted'] as int?,
    updated_at: json['updated_at'] as String?,
    image_path: json['image_path'],
    image_url: json['image_url'] as String?,
    name: json['name'] as String?,
    multi_answer: (json['multi_answer'] as List<dynamic>?)
        ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
        .toList(),
    created_at: json['created_at'],
    id: json['id'] as int?,
    body: json['body'] as String?,
    point: json['point'] as String?,
  );
}

Map<String, dynamic> _$_$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'image': instance.image,
      'is_deleted': instance.is_deleted,
      'updated_at': instance.updated_at,
      'image_path': instance.image_path,
      'image_url': instance.image_url,
      'name': instance.name,
      'multi_answer': instance.multi_answer,
      'created_at': instance.created_at,
      'id': instance.id,
      'body': instance.body,
      'point': instance.point,
    };
