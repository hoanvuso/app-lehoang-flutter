import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_register.freezed.dart';

part 'request_register.g.dart';

@freezed
class RequestRegister with _$RequestRegister {
  factory RequestRegister({
    String? password,
    String? username,
  }) = _RequestRegister;

  factory RequestRegister.fromJson(Map<String, dynamic> json) => _$RequestRegisterFromJson(json);
}
