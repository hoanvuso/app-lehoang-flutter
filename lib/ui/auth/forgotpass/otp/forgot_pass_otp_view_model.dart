import 'dart:async';

import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_verify_otp_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final forgotPassOtpViewModel = ChangeNotifierProvider.autoDispose((ref) =>
    ForgotPassOtpViewModel(ref.read(authRepositoryProvider), ref.read(prefsProvider), ref.read(broadCastProvider)));

class ForgotPassOtpViewModel extends BaseLoadingChangeNotifier {
  final AuthRepository _authRepository;
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;

  ForgotPassOtpViewModel(this._authRepository, this._prefsProvider, this._broadCastProvider);

  String? username;

  bool isResendAble = false;

  void setResendAble(bool enable) {
    isResendAble = enable;
    notifyListeners();
  }

  Future<bool> resendOtp() async {
    final request = RequestForgotPass(username: username);
    final result = await handleResultAPI<bool>(
      _authRepository.requestOtpForgotPass(request),
      isShowLoading: true,
    );

    return result;
  }

  Future<bool> verifyOtpForgotPass(String verifyCode) async {
    final request = RequestVerifyOtpForgotPass(
      username: username,
      token: verifyCode,
    );
    final result = await handleResultAPI<bool>(_authRepository.verifyOtpForgotPass(request), isShowLoading: true);
    return result;
  }
}
