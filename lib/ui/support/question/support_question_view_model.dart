import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final supportQuestionViewModel = ChangeNotifierProvider.autoDispose((ref) => SupportQuestionViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class SupportQuestionViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  SupportQuestionViewModel(this._prefsProvider, this._supportRepository);

  Future<List<SupportObject>?> loadFrequentlyQuestion(int page) async {
    final request = BaseRequest(page: page, limit: 10);
    return handleResultAPI<List<SupportObject>?>(_supportRepository.loadFrequentlyQuestion(request),
        isShowLoading: true);
  }
}
