import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';

part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  factory Answer({
    String? updated_at,
    String? created_at,
    int? id,
    int? sort,
    String? body,
    int? question_id,
    int? is_correct,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
