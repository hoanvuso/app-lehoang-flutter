import 'dart:async';

import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/question/challenge_help.dart';
import 'package:flutter_lehoang_extracare/data/model/question/question.dart';
import 'package:flutter_lehoang_extracare/data/model/question/response_answer.dart';
import 'package:flutter_lehoang_extracare/data/model/question/survey.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_answer.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_answer_choice.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/challenge/challenge_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:flutter_lehoang_extracare/utils/extension/dart_extension_methods.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final challengeViewModel = ChangeNotifierProvider.autoDispose((ref) => ChallengeViewModel(
      ref.read(prefsProvider),
      ref.read(challengerRepositoryProvider),
      ref.read(authRepositoryProvider),
      ref.read(broadCastProvider),
    ));

class ChallengeViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;
  final AuthRepository _authRepository;
  final ChallengeRepository _challengeRepository;

  ChallengeViewModel(this._prefsProvider, this._challengeRepository, this._authRepository, this._broadCastProvider);

  ChallengeHelp? challengeHelp;

  Survey? survey;

  List<Question>? questionList;
  List<int> answerIdList = [];
  int index = 0;

  Question? currentQuestion;
  int? currentSelectedAnswerId;

  void setSelectedAnswer(int? id) {
    if (id == null) return;
    currentSelectedAnswerId = id;
    if (answerIdList.length <= index) {
      answerIdList.add(currentSelectedAnswerId!);
    } else
      answerIdList[index] = currentSelectedAnswerId!;
    notifyListeners();
  }

  bool nextQuestion() {
    if ((questionList?.length ?? 0) <= index + 1) {
      return false;
    }
    index++;
    currentQuestion = questionList![index];
    currentSelectedAnswerId = answerIdList.elementAtOrNull(index);
    notifyListeners();
    return true;
  }

  bool previousQuestion() {
    if (index == 0) {
      return false;
    }

    index--;
    currentQuestion = questionList![index];
    currentSelectedAnswerId = answerIdList.elementAtOrNull(index);
    notifyListeners();
    return true;
  }

  Future<dynamic> loadQuestion() {
    return handleResultAPI<Survey?>(_challengeRepository.loadQuestion()).then((survey) {
      if (survey == null || survey.data == null || survey.data!.isEmpty) return;
      this.survey = survey;
      questionList = survey.data;
      currentQuestion = questionList![0];
      notifyListeners();
    });
  }

  Future<dynamic> loadChallengeHelp() {
    return handleResultAPI<ChallengeHelp?>(_challengeRepository.loadChallengeHelp()).then((challengeHelp) {
      this.challengeHelp = challengeHelp;
      notifyListeners();
    });
  }

  Future<ResponseAnswer?> sendAnswer() {
    List<RequestAnswerChoice>? choices = [];
    questionList?.asMap().forEach((index, value) {
      choices.add(RequestAnswerChoice(question_id: value.id, answer_id: answerIdList[index]));
    });

    final request = RequestAnswer(survey_id: survey?.survey_id, choices: choices);
    return handleResultAPI<ResponseAnswer?>(_challengeRepository.sendAnswer(request), isShowLoading: true);
  }

  void reloadUserNewPoint() {
    handleResultAPI<User?>(_authRepository.loadProfile(), isShowError: false).then((user) {
      if (user != null) {
        _broadCastProvider.updateCurrentUser(user);
      }
    });
  }
}
