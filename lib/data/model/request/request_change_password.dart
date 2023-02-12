import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_change_password.freezed.dart';

part 'request_change_password.g.dart';

@freezed
class RequestChangePassword with _$RequestChangePassword {
  factory RequestChangePassword({
    String? old_password,
    String? password_confirmation,
    String? password,
  }) = _RequestChangePassword;

  factory RequestChangePassword.fromJson(Map<String, dynamic> json) => _$RequestChangePasswordFromJson(json);
}
