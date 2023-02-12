import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';

final broadCastProvider = ChangeNotifierProvider<AppBroadCast>((ref) => AppBroadCast(ref.read(prefsProvider)));

class AppBroadCast extends ChangeNotifier {
  AppBroadCast(this._pref) {
    badgeNotification = 0;
    currentUser ??= _pref.getUser();
    // appColor ??= _pref.getAppColor();
    // cartNumber ??= _pref.getCart().length;
  }

  final PrefsProvider _pref;

  int? badgeNotification;
  User? currentUser;

  int? cartNumber;
  Color? appColor;

  void updateNotificationNumber(int number) async {
    badgeNotification = number;
    notifyListeners();
  }

  void updateCurrentUser(User? user) async {
    currentUser = user;
    _pref.saveUser(user);
    notifyListeners();
  }
}
