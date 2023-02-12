import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'base_request.freezed.dart';

part 'base_request.g.dart';

@freezed
class BaseRequest with _$BaseRequest {
  factory BaseRequest({
    int? limit,
    int? page,
    String? search,
  }) = _BaseRequest;

  factory BaseRequest.fromJson(Map<String, dynamic> json) => _$BaseRequestFromJson(json);
}
