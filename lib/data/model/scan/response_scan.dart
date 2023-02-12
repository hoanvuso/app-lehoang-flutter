import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_scan.freezed.dart';

part 'response_scan.g.dart';

@freezed
class ResponseScan with _$ResponseScan {
  factory ResponseScan({
    String? code_string,
    String? item_type,
    String? created_at,
    int? type,
    String? message,
    String? product_name,
    Object? point,
    int? code_id,
    Object? category_id,
    String? updated_at,
    int? user_id,
    int? product_id,
    int? id,
  }) = _ResponseScan;

  factory ResponseScan.fromJson(Map<String, dynamic> json) => _$ResponseScanFromJson(json);

  ResponseScan._();

  String getPoint() {
    return point.toString();
  }
}


