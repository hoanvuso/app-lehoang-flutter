
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_point.dart';
import 'package:flutter_lehoang_extracare/data/model/question/challenge_help.dart';
import 'package:flutter_lehoang_extracare/data/model/question/question.dart';
import 'package:flutter_lehoang_extracare/data/model/question/response_answer.dart';
import 'package:flutter_lehoang_extracare/data/model/question/survey.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_answer.dart';

abstract class ChallengeRepository {
  // load Survey -> list Question -> list Answer
  Future<Result<Survey?>> loadQuestion();

  Future<Result<ResponseAnswer?>> sendAnswer(RequestAnswer requestAnswer);

  Future<Result<ChallengeHelp?>> loadChallengeHelp();
}
