import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_category.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productCategoryChildViewModel = ChangeNotifierProvider.autoDispose((ref) => ProductCategoryChildViewModel(
      ref.read(prefsProvider),
      ref.read(productRepositoryProvider),
    ));

class ProductCategoryChildViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final ProductRepository _productRepository;

  ProductCategoryChildViewModel(this._prefsProvider, this._productRepository);

  ProductCompany? productCompany;
  ProductCategory? categoryParent;
  String? textSearch;

  Future<List<ProductCategory>?> loadProductCategories(int page) {
    if (categoryParent?.id == null) return Future.value(null);
    // var request = BaseRequest(page: page, limit: 10, search: textSearch);
    final request = RequestSearchProductCategory(category_id: categoryParent!.id!, keywords: textSearch);
    return handleResultAPI<List<ProductCategory>?>(_productRepository.loadProductCategories(request));
  }
}
