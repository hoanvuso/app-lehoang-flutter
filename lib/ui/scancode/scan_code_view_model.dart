import 'dart:async';

import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/base/app_error.dart';
import 'package:flutter_lehoang_extracare/data/model/scan/response_scan.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scanCodeViewModel = ChangeNotifierProvider.autoDispose((ref) => ScanCodeViewModel(
      ref.read(prefsProvider),
      ref.read(authRepositoryProvider),
      ref.read(productRepositoryProvider),
      ref.read(broadCastProvider),
    ));

class ScanCodeViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;
  final ProductRepository _productRepository;
  final AuthRepository _authRepository;

  ScanCodeViewModel(this._prefsProvider, this._authRepository, this._productRepository, this._broadCastProvider);

  int? notice = 1;

  Future<ResponseScan?> sendQrCode(String code) {
    Completer<ResponseScan> completer = Completer();

    doWithLoading(_productRepository.scanProduct(code).then((value) {
      try {
        final result = value.dataOrThrow;

        completer.complete(result);
      } on AppError catch (e) {
        pushError(e);
        completer.complete(null);
      }
    }));

    return completer.future;
  }

  Future<ResponseScan?> checkCode(String code) {
    Completer<ResponseScan> completer = Completer();

    doWithLoading(_productRepository.scanProductCheck(code).then((value) {
      try {
        final result = value.dataOrThrow;

        completer.complete(result);
      } on AppError catch (e) {
        pushError(e);
        completer.complete(null);
      }
    }));

    return completer.future;
  }


  void reloadUserNewPoint() {
    handleResultAPI<User?>(_authRepository.loadProfile(), isShowError: false).then((user) {
      if (user != null) {
        _broadCastProvider.updateCurrentUser(user);
      }
    });
  }
}
