import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';

final masterPageViewModel = ChangeNotifierProvider.autoDispose((ref) => MasterPageViewModel(ref.read(prefsProvider)));

enum MasterPageTab {
  tabHome,
  tabProduct,
  tabScanCode,
  tabPromotion,
  tabSupport,
}

class MasterPageViewModel extends ChangeNotifier {
  final PrefsProvider _prefsProvider;

  MasterPageViewModel(this._prefsProvider);

  MasterPageTab tab = MasterPageTab.tabHome;

  final ListQueue<String?> _queuePage = ListQueue();

  void addPageToBackStack(String? pageName, [bool isRefreshStack = true]) {
    if (pageName == '/') return;
    if (isRefreshStack == true) {
      if (pageName == Constants.pageHome) {
        _queuePage.clear();
      } else {
        _queuePage.clear();
        _queuePage.add(Constants.pageHome);
      }
    }
    _queuePage.addLast(pageName);

    _setTabFromPageName(pageName);
  }

  void backPageFromBackStack() {
    if (_queuePage.isNotEmpty) {
      _queuePage.removeLast();
      var pageName = _queuePage.last;
      _setTabFromPageName(pageName);
    }
  }

  void _setTabFromPageName(String? pageName) {
    switch (pageName) {
      case Constants.pageHome:
        tab = MasterPageTab.tabHome;
        break;
      case Constants.pageProductCompany:
        tab = MasterPageTab.tabProduct;
        break;
      case Constants.pageScanCode:
        tab = MasterPageTab.tabScanCode;
        break;
      case Constants.pagePromotion:
        tab = MasterPageTab.tabPromotion;
        break;
      case Constants.pageSupport:
        tab = MasterPageTab.tabSupport;
        break;
      default:
        break;
    }
    notifyListeners();
  }

// void getBearerToken() async {
//   bearerToken = await _authRepository.loadBearerToken();
// }
//
// void saveDeviceToken(String deviceToken) {
//   _authRepository.saveDeviceToken(deviceToken);
// }
}
