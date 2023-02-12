import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category_feature.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productCompareViewModel = ChangeNotifierProvider.autoDispose((ref) => ProductCompareViewModel(
      ref.read(prefsProvider),
      ref.read(productRepositoryProvider),
    ));

class ProductCompareViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final ProductRepository _productRepository;

  ProductCompareViewModel(this._prefsProvider, this._productRepository);

  ProductCategory? categoryChild;
  List<Product>? productList;
  List<ProductCategoryFeature>? featureList;

  Future<List<ProductCategoryFeature>?> loadProductCategoryFeature() async {
    final list = await handleResultAPI<List<ProductCategoryFeature>?>(
        _productRepository.loadCategoryFeatures(categoryChild?.id ?? 1));
    featureList = list;
    notifyListeners();
  }
}
