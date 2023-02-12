import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final supportSolutionDetailViewModel = ChangeNotifierProvider.autoDispose((ref) => SupportSolutionDetailViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class SupportSolutionDetailViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  SupportSolutionDetailViewModel(this._prefsProvider, this._supportRepository);

  SupportObject? solution;
}
