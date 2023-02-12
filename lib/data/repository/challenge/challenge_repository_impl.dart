import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/splite/database_provider.dart';
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
import 'package:flutter_lehoang_extracare/data/model/request/request_exchange_gift.dart';
import 'package:flutter_lehoang_extracare/data/network/dio_provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/challenge/challenge_repository.dart';

class ChallengeRepositoryImpl implements ChallengeRepository {
  ChallengeRepositoryImpl(
      {required DatabaseProvider databaseProvider,
      required PrefsProvider prefsProvider,
      required DioProvider dioProvider})
      : _databaseProvider = databaseProvider,
        _dioProvider = dioProvider,
        _prefsProvider = prefsProvider;

  final DatabaseProvider _databaseProvider;
  final DioProvider _dioProvider;
  final PrefsProvider _prefsProvider;

  @override
  Future<Result<List<Gift>?>> loadGifts(BaseRequest request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadGifts(request);
        return baseResponse.data;
      });

  @override
  Future<Result> exchangeGift(int giftId, RequestExchangeGift request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.exchangeGift(giftId, request);
        return baseResponse.data;
      });

  @override
  Future<Result<Survey?>> loadQuestion() => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadQuestion();
        return baseResponse.data;
      });

  @override
  Future<Result<ResponseAnswer?>> sendAnswer(RequestAnswer requestAnswer) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.sendAnswerChallenge(requestAnswer);
        return baseResponse.data;
      });

  @override
  Future<Result<ChallengeHelp?>> loadChallengeHelp() => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.loadChallengeHelp();
    return baseResponse.data;
  });


// @override
// Future<Result<ResponseLogin?>> login(RequestLogin request) => Result.guardFuture(() async {
//   final baseResponse = await _dioProvider.login(request);
//   return baseResponse.data;
// });
//
// @override
// Future<Result<User?>> register(RequestRegister request) => Result.guardFuture(() async {
//   final baseResponse = await _dioProvider.register(request);
//   return baseResponse.data;
// });
}
