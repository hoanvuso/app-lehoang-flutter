import 'dart:async';

import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_login.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final forgotPassPhoneViewModel = ChangeNotifierProvider.autoDispose((ref) =>
    ForgotPassPhoneViewModel(ref.read(authRepositoryProvider), ref.read(prefsProvider), ref.read(broadCastProvider)));

class ForgotPassPhoneViewModel extends BaseLoadingChangeNotifier {
  final AuthRepository _authRepository;
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;

  ForgotPassPhoneViewModel(this._authRepository, this._prefsProvider, this._broadCastProvider);

  Future<bool?> requestOtpForgotPass(String username) async {
    final request = RequestForgotPass(username: username);
    final result = await handleResultAPI<bool>(
      _authRepository.requestOtpForgotPass(request),
      isShowLoading: true,
    );

    return result;
  }
}
