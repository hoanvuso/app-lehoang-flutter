import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_exchange_gift.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/gift/gift_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final giftDetailViewModel = ChangeNotifierProvider.autoDispose((ref) => GiftDetailViewModel(
      ref.read(prefsProvider),
      ref.read(giftRepositoryProvider),
      ref.read(authRepositoryProvider),
      ref.read(broadCastProvider),
    ));

class GiftDetailViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final GiftRepository _giftRepository;
  final AuthRepository _authRepository;
  final AppBroadCast _broadCastProvider;

  GiftDetailViewModel(this._prefsProvider, this._giftRepository, this._authRepository, this._broadCastProvider);

  int quantity = 1;

  //
  // void setQuantity(int quantity) {
  //   this.quantity = quantity;
  //   notifyListeners();
  // }

  Future<bool?> exchangeGift(int? idGift) {
    final request = RequestExchangeGift(qty: quantity);
    if (idGift == null) return Future.value(false);
    return handleResultAPI<bool>(_giftRepository.exchangeGift(idGift, request));
  }

  void reloadUserNewPoint() {
    handleResultAPI<User?>(_authRepository.loadProfile(), isShowError: false).then((user) {
      if (user != null) {
        _broadCastProvider.updateCurrentUser(user);
      }
    });
  }
}
