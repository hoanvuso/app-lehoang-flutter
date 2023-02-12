import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_register.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_verify.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerVerifyViewModel = ChangeNotifierProvider.autoDispose((ref) =>
    RegisterVerifyViewModel(ref.read(authRepositoryProvider), ref.read(prefsProvider), ref.read(broadCastProvider)));

class RegisterVerifyViewModel extends BaseLoadingChangeNotifier {
  final AuthRepository _authRepository;
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;

  RegisterVerifyViewModel(this._authRepository, this._prefsProvider, this._broadCastProvider);

  String? username;
  String? password;

  bool isResendAble = false;

  void setResendAble(bool enable) {
    isResendAble = enable;
    notifyListeners();
  }

  Future<bool> resendOtp() async {
    final request = RequestRegister(
      username: username,
      password: password,
    );
    final result = handleResultAPI<Object?>(_authRepository.register(request), isShowLoading: true);

    if (result != null && result is num) {
      return true;
    } else
      return false;
  }

  Future<bool> verify(String verifyCode) async {
    final request = RequestVerify(
      username: username,
      verify_code: verifyCode,
      device_token: _prefsProvider.getDeviceToken(),
      device_type: Platform.isAndroid ? 'android' : 'ios',
    );
    final user = await handleResultAPI<User>(_authRepository.verifyOtpRegister(request), isShowLoading: true);
    if (user != null) {
      _prefsProvider.saveBearerToken(user.token);
      _broadCastProvider.updateCurrentUser(user);
      return true;
    } else
      return false;
  }
}
