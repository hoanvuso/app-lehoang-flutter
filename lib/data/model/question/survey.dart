import 'package:flutter_lehoang_extracare/data/model/question/question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';

part 'survey.g.dart';

@freezed
class Survey with _$Survey {
  factory Survey({
    List<Question>? data,
    int? survey_id,
    Object? point,
  }) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
}
