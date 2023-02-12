import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productDetailViewModel = ChangeNotifierProvider.autoDispose((ref) => ProductDetailViewModel(
      ref.read(prefsProvider),
      ref.read(productRepositoryProvider),
    ));

class ProductDetailViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final ProductRepository _productRepository;

  ProductDetailViewModel(this._prefsProvider, this._productRepository);

  Product? product;
}
