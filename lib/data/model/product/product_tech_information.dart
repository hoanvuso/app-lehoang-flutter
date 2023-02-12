import 'package:flutter_lehoang_extracare/data/model/product/product_category_feature.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_tech_information.freezed.dart';

part 'product_tech_information.g.dart';

@freezed
class ProductTechInformation with _$ProductTechInformation {
  factory ProductTechInformation({
    String? feature_id,
    String? value,
    ProductCategoryFeature? feature,
  }) = _ProductTechInformation;

  factory ProductTechInformation.fromJson(Map<String, dynamic> json) => _$ProductTechInformationFromJson(json);
}
