import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final supportSolutionViewModel = ChangeNotifierProvider.autoDispose((ref) => SupportSolutionViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class SupportSolutionViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  SupportSolutionViewModel(this._prefsProvider, this._supportRepository);

  Future<List<SupportObject>?> loadSolutions(int page) async {
    final request = BaseRequest(page: page, limit: 10);
    return handleResultAPI<List<SupportObject>?>(_supportRepository.loadSolutions(request), isShowLoading: true);
  }
}
