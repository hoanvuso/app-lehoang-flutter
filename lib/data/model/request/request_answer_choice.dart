import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_answer_choice.freezed.dart';

part 'request_answer_choice.g.dart';

@freezed
class RequestAnswerChoice with _$RequestAnswerChoice {
  factory RequestAnswerChoice({
    int? answer_id,
    int? question_id,
  }) = _RequestAnswerChoice;

  factory RequestAnswerChoice.fromJson(Map<String, dynamic> json) => _$RequestAnswerChoiceFromJson(json);
}
