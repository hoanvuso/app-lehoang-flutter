import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_forgot_pass.freezed.dart';

part 'request_forgot_pass.g.dart';

@freezed
class RequestForgotPass with _$RequestForgotPass {
  factory RequestForgotPass({
    String? username,
  }) = _RequestForgotPass;

  factory RequestForgotPass.fromJson(Map<String, dynamic> json) => _$RequestForgotPassFromJson(json);
}
