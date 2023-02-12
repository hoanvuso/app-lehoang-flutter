import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final supportDocumentViewModel = ChangeNotifierProvider.autoDispose((ref) => SupportDocumentViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class SupportDocumentViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  SupportDocumentViewModel(this._prefsProvider, this._supportRepository);

  Future<List<SupportObject>?> loadDocuments(int page) async {
    final request = BaseRequest(page: page, limit: 10);
    return handleResultAPI<List<SupportObject>?>(_supportRepository.loadDocuments(request), isShowLoading: true);
  }
}
