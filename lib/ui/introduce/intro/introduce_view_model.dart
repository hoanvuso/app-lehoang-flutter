import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/support/introduce.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final introduceViewModel = ChangeNotifierProvider.autoDispose((ref) => IntroduceViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class IntroduceViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  IntroduceViewModel(this._prefsProvider, this._supportRepository);

  Introduce? introduce;

  void loadIntroduce() async {
    final introduce = await handleResultAPI<Introduce?>(_supportRepository.loadIntroduce());
    this.introduce = introduce;
    notifyListeners();
  }
}
