import 'dart:async';

import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_news.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final techViewModel = ChangeNotifierProvider.autoDispose((ref) => TechViewModel(
      ref.read(prefsProvider),
      ref.read(newsRepositoryProvider),
    ));

class TechViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final NewsRepository _newsRepository;

  TechViewModel(this._prefsProvider, this._newsRepository);

  Future<List<NewObject>?> loadTechs(int page) {
    var request = RequestSearchNews(page: page, limit: 10, type: Constants.NEW_TYPE_TECH);
    return handleResultAPI(_newsRepository.loadNews(request));
  }
}
