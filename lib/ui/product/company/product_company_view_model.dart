import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_company.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productCompanyViewModel = ChangeNotifierProvider.autoDispose((ref) => ProductCompanyViewModel(
      ref.read(prefsProvider),
      ref.read(productRepositoryProvider),
    ));

class ProductCompanyViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final ProductRepository _productRepository;

  ProductCompanyViewModel(this._prefsProvider, this._productRepository);

  String? textSearch;

  Future<List<ProductCompany>?> loadProductCompanies(int page) async{
    final request = RequestSearchProductCompany(
      keywords: textSearch,
      page: page
    );
    return handleResultAPI<List<ProductCompany>?>(_productRepository.loadProductCompanies(request));
  }
}
