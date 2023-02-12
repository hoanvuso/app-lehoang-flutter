import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_search_product_category.freezed.dart';

part 'request_search_product_category.g.dart';

@freezed
class RequestSearchProductCategory with _$RequestSearchProductCategory {
  factory RequestSearchProductCategory({
    int? category_id,
    int? trademark_id,
    int? limit,
    int? page,
    String? keywords,
  }) = _RequestSearchProductCategory;

  factory RequestSearchProductCategory.fromJson(Map<String, dynamic> json) =>
      _$RequestSearchProductCategoryFromJson(json);

  RequestSearchProductCategory._();

  String getQuerySearch() {
    return 'categories?${trademark_id != null ? '&trademark_id=${trademark_id}' : ''}'
        '${category_id != null ? '&category_id=${category_id}' : ''}'
        '${page != null ? '&page=${page}' : ''}'
        '${limit != null ? '&limit=${limit}' : ''}'
        '${keywords != null ? '&keywords=${keywords}' : ''}';
  }
}
