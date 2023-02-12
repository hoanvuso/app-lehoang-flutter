// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Survey _$_$_SurveyFromJson(Map<String, dynamic> json) {
  return _$_Survey(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
    survey_id: json['survey_id'] as int?,
    point: json['point'],
  );
}

Map<String, dynamic> _$_$_SurveyToJson(_$_Survey instance) => <String, dynamic>{
      'data': instance.data,
      'survey_id': instance.survey_id,
      'point': instance.point,
    };
