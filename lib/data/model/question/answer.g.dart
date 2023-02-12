// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Answer _$_$_AnswerFromJson(Map<String, dynamic> json) {
  return _$_Answer(
    updated_at: json['updated_at'] as String?,
    created_at: json['created_at'] as String?,
    id: json['id'] as int?,
    sort: json['sort'] as int?,
    body: json['body'] as String?,
    question_id: json['question_id'] as int?,
    is_correct: json['is_correct'] as int?,
  );
}

Map<String, dynamic> _$_$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'id': instance.id,
      'sort': instance.sort,
      'body': instance.body,
      'question_id': instance.question_id,
      'is_correct': instance.is_correct,
    };
