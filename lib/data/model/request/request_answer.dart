import 'package:flutter_lehoang_extracare/data/model/request/request_answer_choice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_answer.freezed.dart';

part 'request_answer.g.dart';

@freezed
class RequestAnswer with _$RequestAnswer {
  factory RequestAnswer({
    int? survey_id,
    List<RequestAnswerChoice>? choices,
  }) = _RequestAnswer;

  factory RequestAnswer.fromJson(Map<String, dynamic> json) => _$RequestAnswerFromJson(json);
}
