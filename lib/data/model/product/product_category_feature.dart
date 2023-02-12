import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category_feature.freezed.dart';

part 'product_category_feature.g.dart';

@freezed
class ProductCategoryFeature with _$ProductCategoryFeature {
  factory ProductCategoryFeature({
    int? category_id,
    String? updated_at,
    String? name,
    String? created_at,
    int? id,
    String? slug,
  }) = _ProductCategoryFeature;

  factory ProductCategoryFeature.fromJson(Map<String, dynamic> json) => _$ProductCategoryFeatureFromJson(json);
}
