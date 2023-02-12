import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  SharedPreferences? _prefs;

  SharedPreferences get prefs {
    if (_prefs == null) {
      initPref();
    }
    return _prefs!;
  }

  Future<void> initPref() async {
    _prefs ??= await SharedPreferences.getInstance();
    return;
  }

  static AppSharedPreferences getInstance() => AppSharedPreferences._();

  AppSharedPreferences._() {
    initPref();
  }
}
