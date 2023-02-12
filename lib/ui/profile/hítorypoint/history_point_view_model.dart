import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_point.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_history_point.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyPointViewModel = ChangeNotifierProvider.autoDispose((ref) => HistoryPointViewModel(
      ref.read(prefsProvider),
      ref.read(authRepositoryProvider),
    ));

class HistoryPointViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final AuthRepository _authRepository;

  HistoryPointViewModel(this._prefsProvider, this._authRepository);

  int selectedTabIndex = 0;
  bool isShowFilter = false;
  String? startDateSearch, endDateSearch;

  void setSelectedTab(int index) {
    this.selectedTabIndex = index;
    notifyListeners();
  }

  void toggleFilter() {
    this.isShowFilter = !isShowFilter;
    if (isShowFilter == false) {
      startDateSearch = null;
      endDateSearch = null;
    }

    notifyListeners();
  }

  Future<List<HistoryPoint>?> loadHistoryPoint(int page, String? type) {
    var request = RequestSearchHistoryPoint(
      page: page,
      limit: 10,
      start_date: startDateSearch,
      end_date: endDateSearch,
      type: type
    );
    return handleResultAPI<List<HistoryPoint>?>(_authRepository.loadHistoryPoint(request));
  }
}
