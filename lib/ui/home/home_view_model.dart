import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/model/news/unread_news_count.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_news.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModel = ChangeNotifierProvider.autoDispose((ref) => HomeViewModel(
      ref.read(authRepositoryProvider),
      ref.read(newsRepositoryProvider),
      ref.read(productRepositoryProvider),
      ref.read(prefsProvider),
      ref.read(broadCastProvider),
    ));

class HomeViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final AppBroadCast _broadCastProvider;
  final AuthRepository _authRepository;
  final NewsRepository _newsRepository;
  final ProductRepository _productRepository;

  HomeViewModel(this._authRepository, this._newsRepository, this._productRepository, this._prefsProvider,
      this._broadCastProvider);

  // User? user;
  List<NewObject>? promotionList;
  List<NewObject>? techList;
  List<Product>? productList;

  User? user;

  void loadUser() {
    user = _prefsProvider.getUser();
    if(user == null){
      _prefsProvider.clearData();

    }
    else{
      _broadCastProvider.updateCurrentUser(user);

    }
    // notifyListeners();
  }

  Future<List<NewObject>?> loadPromotionHome() {
    final request = RequestSearchNews(type: Constants.NEW_TYPE_PROMOTION, is_new: 1);
    return handleResultAPI<List<NewObject>?>(_newsRepository.loadNews(request)).then((value) {
      promotionList = value;
      notifyListeners();
    });
  }

  Future<List<Product>?> loadProductHome() {
    return handleResultAPI<List<Product>?>(_productRepository.loadHomeProduct()).then((value) {
      productList = value;
      notifyListeners();
    });
  }

  Future<List<NewObject>?> loadTechHome() {
    final request = RequestSearchNews(type: Constants.NEW_TYPE_TECH, is_new: 1);
    return handleResultAPI<List<NewObject>?>(_newsRepository.loadNews(request)).then((value) {
      techList = value;
      notifyListeners();
    });
  }

  void loadUnreadNewsCount() async {
    handleResultAPI<UnreadNewsCount?>(_newsRepository.loadUnreadNewsCount(), isShowError: false).then((value) {
      _broadCastProvider.updateNotificationNumber(value?.all ?? 0);
    });
  }
}
