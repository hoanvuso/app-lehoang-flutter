import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_verify_otp_forgot_pass.freezed.dart';

part 'request_verify_otp_forgot_pass.g.dart';

@freezed
class RequestVerifyOtpForgotPass with _$RequestVerifyOtpForgotPass {
  factory RequestVerifyOtpForgotPass({
    String? username,
    String? token,
  }) = _RequestVerifyOtpForgotPass;

  factory RequestVerifyOtpForgotPass.fromJson(Map<String, dynamic> json) => _$RequestVerifyOtpForgotPassFromJson(json);
}
