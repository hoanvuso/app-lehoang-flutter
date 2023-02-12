import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productListViewModel = ChangeNotifierProvider.autoDispose((ref) => ProductListViewModel(
      ref.read(prefsProvider),
      ref.read(productRepositoryProvider),
    ));

class ProductListViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final ProductRepository _productRepository;

  ProductListViewModel(this._prefsProvider, this._productRepository);

  ProductCategory? categoryParent;
  ProductCategory? categoryChild;
  ProductCompany? productCompany;
  String? textSearch;

  Future<List<Product>?> loadProducts(int page) {
    var request = RequestSearchProduct(
      page: page,
      limit: 10,
      keywords: textSearch,
      category_id: categoryChild?.id,
      trademark_id: productCompany?.id,
    );
    return handleResultAPI<List<Product>?>(_productRepository.loadProducts(request));
  }

  // for compare product
  bool isCompare = false;
  List<Product>? productCompareList;

  void changeCompareStatus() {
    isCompare = !isCompare;
    if (isCompare == false) {
      productCompareList?.clear();
    }
    notifyListeners();
  }

  void toggleProductCompare(Product? product) {
    if (product == null) return;
    if (productCompareList == null) productCompareList = [];
    var checkProduct = productCompareList?.firstWhere((p) => p.id == product.id, orElse: () => Product());
    bool isSelected = checkProduct?.id != null;
    if (isSelected) {
      productCompareList?.removeWhere((p) => p.id == product.id);
    } else {
      productCompareList?.add(product);
    }
    final newList = <Product>[];
    newList.addAll(productCompareList ?? []);
    productCompareList = newList;
    notifyListeners();
  }
}
