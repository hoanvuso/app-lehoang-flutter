import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/splite/database_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category_feature.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_scan_product.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/scan/response_scan.dart';
import 'package:flutter_lehoang_extracare/data/network/dio_provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
      {required DatabaseProvider databaseProvider,
      required PrefsProvider prefsProvider,
      required DioProvider dioProvider})
      : _databaseProvider = databaseProvider,
        _dioProvider = dioProvider,
        _prefsProvider = prefsProvider;

  final DatabaseProvider _databaseProvider;
  final DioProvider _dioProvider;
  final PrefsProvider _prefsProvider;

  @override
  Future<Result<ResponseScan?>> scanProduct(String code) => Result.guardFuture(() async {
        final request = RequestScanProduct(code: code, is_confirmed: true);
        final baseResponse = await _dioProvider.scanProduct(request);
        return baseResponse.data;
      });

  @override
  Future<Result<ResponseScan?>> scanProductCheck(String code) => Result.guardFuture(() async {
        final request = RequestScanProduct(code: code, is_confirmed: false);
        final baseResponse = await _dioProvider.scanProduct(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<Product>?>> loadHomeProduct() => Result.guardFuture(() async {
        final request = RequestSearchProduct(is_new: 1, limit: 10);
        final baseResponse = await _dioProvider.loadProducts(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<ProductCompany>?>> loadProductCompanies(RequestSearchProductCompany request) =>
      Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadProductCompanies(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<ProductCategory>?>> loadProductCategories(RequestSearchProductCategory request) =>
      Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadProductCategorys(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<Product>?>> loadProducts(RequestSearchProduct request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadProducts(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<ProductCategoryFeature>?>> loadCategoryFeatures(int categoryId) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadCategoryFeatures(categoryId);
        return baseResponse.data;
      });
}
