import 'dart:async';
import 'dart:io';

import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_login.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginViewModel = ChangeNotifierProvider.autoDispose(
    (ref) => LoginViewModel(ref.read(authRepositoryProvider), ref.read(prefsProvider), ref.read(broadCastProvider)));

class LoginViewModel extends BaseLoadingChangeNotifier {
  final AuthRepository _authRepository;
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;

  LoginViewModel(this._authRepository, this._prefsProvider, this._broadCastProvider);

  Future<User?> login(String username, String password) async {
    final request = RequestLogin(
      username: username,
      password: password,
      deviceToken: _prefsProvider.getDeviceToken(),
      deviceType: Platform.isAndroid ? 'android' : 'ios',
    );
    final user = await handleResultAPI<User?>(
      _authRepository.login(request),
      isShowLoading: true,
    );

    if (user != null) {
      _prefsProvider.saveBearerToken(user.token);
      _broadCastProvider.updateCurrentUser(user);
    }

    return user;
  }
}
