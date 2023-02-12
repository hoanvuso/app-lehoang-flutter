import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/config/common_banner.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_category.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productCategoryViewModel = ChangeNotifierProvider.autoDispose((ref) => ProductCategoryViewModel(
      ref.read(prefsProvider),
      ref.read(productRepositoryProvider),
      ref.read(newsRepositoryProvider),
    ));

class ProductCategoryViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final ProductRepository _productRepository;
  final NewsRepository _newsRepository;

  ProductCategoryViewModel(this._prefsProvider, this._productRepository, this._newsRepository);

  List<CommonBanner>? listBanners;
  ProductCompany? productCompany;
  String? textSearch;

  Future<List<ProductCategory>?> loadProductCategories(int page) {
    if (productCompany?.id == null) return Future.value(null);
    // var request = BaseRequest(page: page, limit: 10, search: textSearch);
    final request = RequestSearchProductCategory(trademark_id: productCompany!.id!, keywords: textSearch);
    return handleResultAPI<List<ProductCategory>?>(_productRepository.loadProductCategories(request));
  }

  Future<List<ProductCategory>?> loadBanners() async {
    final list = await handleResultAPI<List<CommonBanner>?>(_newsRepository.loadCommonBanners());
    listBanners = list;
    notifyListeners();
  }
}
