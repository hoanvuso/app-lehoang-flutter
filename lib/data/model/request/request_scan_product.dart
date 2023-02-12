import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_scan_product.freezed.dart';

part 'request_scan_product.g.dart';

@freezed
class RequestScanProduct with _$RequestScanProduct {
  factory RequestScanProduct({
    String? code,
    bool? is_confirmed,
  }) = _RequestScanProduct;

  factory RequestScanProduct.fromJson(Map<String, dynamic> json) => _$RequestScanProductFromJson(json);
}
