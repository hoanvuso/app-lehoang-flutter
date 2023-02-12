import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_answer.freezed.dart';

part 'response_answer.g.dart';

@freezed
class ResponseAnswer with _$ResponseAnswer {
  factory ResponseAnswer({
    int? numberCorrect,
    int? point,
  }) = _ResponseAnswer;

  factory ResponseAnswer.fromJson(Map<String, dynamic> json) => _$ResponseAnswerFromJson(json);
}
