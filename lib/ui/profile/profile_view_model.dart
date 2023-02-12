import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_response.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_password.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileViewModel = ChangeNotifierProvider.autoDispose(
    (ref) => ProfileViewModel(ref.read(prefsProvider), ref.read(authRepositoryProvider)));

class ProfileViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final AuthRepository _authRepository;

  ProfileViewModel(this._prefsProvider, this._authRepository);

  Future<User?> changePassword(RequestChangePassword requestChangePassword) async {
    final user =
        await handleResultAPI<User?>(_authRepository.changePassword(requestChangePassword), isShowLoading: true);
    if (user != null) {
      _prefsProvider.saveBearerToken(user.token);
    }
    return user;
  }

  Future<BaseResponse> deleteAccount() async {
    return await handleResultAPI<BaseResponse>(_authRepository.deleteAccount(), isShowLoading: true);
  }




}
