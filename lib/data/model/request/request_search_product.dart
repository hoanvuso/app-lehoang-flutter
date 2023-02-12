import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_search_product.freezed.dart';

part 'request_search_product.g.dart';

@freezed
class RequestSearchProduct with _$RequestSearchProduct {
  factory RequestSearchProduct({
    int? category_id,
    int? trademark_id,
    int? limit,
    int? page,
    int? is_new, //lấy sản phẩm mới thì is_new = 1
    String? keywords,
  }) = _RequestSearchProduct;

  factory RequestSearchProduct.fromJson(Map<String, dynamic> json) => _$RequestSearchProductFromJson(json);

  RequestSearchProduct._();

  String getQuerySearch() {
    return 'products?${category_id != null ? 'category_id=${category_id}' : ''}'
        '${trademark_id != null ? '&trademark_id=${trademark_id}' : ''}'
        '${page != null ? '&page=${page}' : ''}'
        '${limit != null ? '&limit=${limit}' : ''}'
        '${keywords != null ? '&keywords=${keywords}' : ''}';
  }
}
