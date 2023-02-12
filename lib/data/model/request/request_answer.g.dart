// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestAnswer _$_$_RequestAnswerFromJson(Map<String, dynamic> json) {
  return _$_RequestAnswer(
    survey_id: json['survey_id'] as int?,
    choices: (json['choices'] as List<dynamic>?)
        ?.map((e) => RequestAnswerChoice.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_RequestAnswerToJson(_$_RequestAnswer instance) =>
    <String, dynamic>{
      'survey_id': instance.survey_id,
      'choices': instance.choices,
    };
