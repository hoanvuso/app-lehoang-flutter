import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_login.freezed.dart';

part 'request_login.g.dart';

@freezed
class RequestLogin with _$RequestLogin {
  factory RequestLogin({
    String? deviceType,
    String? password,
    String? username,
    String? deviceToken,
  }) = _RequestLogin;

  factory RequestLogin.fromJson(Map<String, dynamic> json) => _$RequestLoginFromJson(json);
}
