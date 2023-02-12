import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_company.freezed.dart';

part 'product_company.g.dart';

@freezed
class ProductCompany with _$ProductCompany {
  factory ProductCompany({
    String? image,
    String? updated_at,
    String? image_path,
    String? image_url,
    String? name,
    String? created_at,
    int? id,
    String? slug,
  }) = _ProductCompany;

  factory ProductCompany.fromJson(Map<String, dynamic> json) => _$ProductCompanyFromJson(json);
}
