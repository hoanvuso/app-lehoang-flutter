import 'dart:async';
import 'dart:io';

import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile_image.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileUpdateViewModel = ChangeNotifierProvider.autoDispose((ref) =>
    ProfileUpdateViewModel(ref.read(prefsProvider), ref.read(authRepositoryProvider), ref.read(broadCastProvider)));

class ProfileUpdateViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;
  final AuthRepository _authRepository;

  ProfileUpdateViewModel(this._prefsProvider, this._authRepository, this._broadCastProvider);

  File? profileImage;

  void setProfileImage(File f) {
    profileImage = f;
    notifyListeners();
  }

  Future<User?> updateProfileImage() {
    if (profileImage == null) return Future.value(User());
    final request = RequestUpdateProfileImage(profileImage);
    return handleResultAPI<User?>(_authRepository.updateProfileImage(request)).then((user) {
      if (user != null) {
        _broadCastProvider.updateCurrentUser(user);
      }
      return user;
    });
  }

  Future<User?> updateProfile(RequestUpdateProfile request) {
    return handleResultAPI<User?>(_authRepository.updateProfile(request)).then((user) {
      if (user != null) {
        _broadCastProvider.updateCurrentUser(user);
      }
      return user;
    });
  }
}
