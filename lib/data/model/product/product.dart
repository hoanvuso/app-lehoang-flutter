import 'package:flutter_lehoang_extracare/data/model/product/product_tech_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    String? image_url,
    String? short_body,
    String? serial_code,
    int? ordering,
    String? description,
    Object? created_at,
    String? specifications,
    int? point,
    Object? updated_at,
    Object? category_id,
    Object? image_path,
    String? name,
    String? model,
    int? id,
    int? price,
    String? material_code,
    List<ProductTechInformation>? tech_infomations,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
