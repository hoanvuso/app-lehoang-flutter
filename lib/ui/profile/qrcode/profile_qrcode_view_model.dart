import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile_image.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileQrCodeViewModel = ChangeNotifierProvider.autoDispose(
    (ref) => ProfileQrCodeViewModel(ref.read(prefsProvider), ref.read(authRepositoryProvider)));

class ProfileQrCodeViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final AuthRepository _authRepository;

  ProfileQrCodeViewModel(this._prefsProvider, this._authRepository);
}
