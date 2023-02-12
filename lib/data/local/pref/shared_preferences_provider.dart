import 'dart:convert';

import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/support/introduce.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsProvider {
  static const String FCM_MESSAGE_ID = 'FCM_MESSAGE_ID';
  static const String BADGE_NOTIFICATION = 'BADGE_NOTIFICATION';
  static const String CART_NUMBER = 'CART_NUMBER';
  static const String PREF_BEARER_TOKEN = 'PREF_BEARER_TOKEN';
  static const String PREF_DEVICE_TOKEN = 'PREF_DEVICE_TOKEN';
  static const String PREF_CART = 'PREF_CART';
  static const String PREF_USER = 'PREF_USER';
  static const String PREF_INTRODUCE = 'PREF_INTRODUCE';
  static const String PREF_FACEBOOK = 'PREF_FACEBOOK';
  static const String PREF_ZALO = 'PREF_ZALO';
  static const String PREF_HOTLINE = 'PREF_HOTLINE';

  SharedPreferences? prefs;

  PrefsProvider() {
    initPref();
  }

  Future<void> initPref() async {
    prefs ??= await SharedPreferences.getInstance();
    return;
  }

  void clearData() async {
    saveUser(null);
    saveBearerToken(null);
  }

  //======================= This save FCMMessageId to fix issue FCM getInitialMessage call multitime
  String? getFCMMessageId() => prefs?.getString(FCM_MESSAGE_ID);

  void saveFCMMessageId(String? str) => prefs?.setString(FCM_MESSAGE_ID, str ?? '');

  // ======================= save Auth

  String? getDeviceToken() => prefs?.getString(PREF_DEVICE_TOKEN);

  void saveDeviceToken(String? webLink) => prefs?.setString(PREF_DEVICE_TOKEN, webLink ?? '');

  String? getBearerToken() => prefs?.getString(PREF_BEARER_TOKEN);

  void saveBearerToken(String? webLink) => prefs?.setString(PREF_BEARER_TOKEN, webLink ?? '');

  User? getUser() {
    final str = prefs?.getString(PREF_USER);
    if (str == null || str.isEmpty) return null;
    return User.fromJson(json.decode(str));
  }

  void saveUser(User? user) {
    if (user == null) {
      prefs?.setString(PREF_USER, "");
      return;
    }
    prefs?.setString(PREF_USER, json.encode(user.toJson()));
  }

  // ======================= save Setting
  String? getFacebookValue() => prefs?.getString(PREF_FACEBOOK);

  void saveFacebookValue(String? value) => prefs?.setString(PREF_FACEBOOK, value ?? '');

  String? getZaloValue() => prefs?.getString(PREF_ZALO);

  void saveZaloValue(String? value) => prefs?.setString(PREF_ZALO, value ?? '');

  String? getHotlineValue() => prefs?.getString(PREF_HOTLINE);

  void saveHotlineValue(String? value) => prefs?.setString(PREF_HOTLINE, value ?? '');

  // ======================= save Introduce
  Introduce? getIntroduce() {
    final str = prefs?.getString(PREF_INTRODUCE);
    if (str == null || str.isEmpty) return null;
    return Introduce.fromJson(json.decode(str));
  }

  void saveIntroduce(Introduce? introduce) {
    if (introduce == null) {
      prefs?.setString(PREF_INTRODUCE, "");
      return;
    }
    prefs?.setString(PREF_INTRODUCE, json.encode(introduce.toJson()));
  }
}
