import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_verify.freezed.dart';

part 'request_verify.g.dart';

@freezed
class RequestVerify with _$RequestVerify {
factory RequestVerify({
String? device_token,
String? device_type,
String? verify_code,
String? username,}) = _RequestVerify;

factory RequestVerify.fromJson(Map<String, dynamic> json) => _$RequestVerifyFromJson(json);
}