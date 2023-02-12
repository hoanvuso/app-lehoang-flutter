import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_news.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/gift/gift_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationViewModel = ChangeNotifierProvider.autoDispose((ref) => NotificationViewModel(
      ref.read(prefsProvider),
      ref.read(newsRepositoryProvider),
    ));

class NotificationViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final NewsRepository _newsRepository;

  NotificationViewModel(this._prefsProvider, this._newsRepository);

  int selectedTabIndex = 0;

  void setSelectedTab(int index) {
    this.selectedTabIndex = index;
    notifyListeners();
  }

  Future<List<NewObject>?> loadNews(int page, [String? type]) {
    var request = RequestSearchNews(page: page, limit: 10, type: type);
    return handleResultAPI(_newsRepository.loadNews(request));
  }
}

