import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category_feature.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/scan/response_scan.dart';

abstract class ProductRepository {
  Future<Result<ResponseScan?>> scanProduct(String code);

  Future<Result<ResponseScan?>> scanProductCheck(String code);

  Future<Result<List<Product>?>> loadHomeProduct();

  Future<Result<List<ProductCompany>?>> loadProductCompanies(RequestSearchProductCompany request);

  /*
   Dùng chung cho load danh mục cha/ danh mục con
   - Nếu load danh mục cha thì truyền trademark_id
   - Nếu load danh mục con thì truyền category_id
   Trong Productcategory có subcategory_count, nếu giá trị này lớn hơn 0 thì nó là danh mục cha
   */
  Future<Result<List<ProductCategory>?>> loadProductCategories(RequestSearchProductCategory request);

  Future<Result<List<Product>?>> loadProducts(RequestSearchProduct request);

  Future<Result<List<ProductCategoryFeature>?>> loadCategoryFeatures(int categoryId);
}
