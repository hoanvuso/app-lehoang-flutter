import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';

part 'product_category.g.dart';

@freezed
class ProductCategory with _$ProductCategory {
  factory ProductCategory({
    String? image,
    String? updated_at,
    String? image_path,
    String? image_url,
    String? name,
    String? created_at,
    int? id,
    String? slug,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => _$ProductCategoryFromJson(json);
}
