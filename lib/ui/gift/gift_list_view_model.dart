import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/gift/gift_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final giftListViewModel = ChangeNotifierProvider.autoDispose((ref) => GiftListViewModel(
      ref.read(prefsProvider),
      ref.read(giftRepositoryProvider),
    ));

class GiftListViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final GiftRepository _giftRepository;

  GiftListViewModel(this._prefsProvider, this._giftRepository);

  Future<List<Gift>?> loadGiftHistory(int page) {
    var request = BaseRequest(page: page, limit: 10);
    return handleResultAPI<List<Gift>?>(_giftRepository.loadGifts(request));
  }
}
