import 'package:flutter_lehoang_extracare/data/model/question/answer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    Object? image,
    int? is_deleted,
    String? updated_at,
    Object? image_path,
    String? image_url,
    String? name,
    List<Answer>? multi_answer,
    Object? created_at,
    int? id,
    String? body,
    String? point,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
