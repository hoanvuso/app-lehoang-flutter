import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_update_profile.freezed.dart';

part 'request_update_profile.g.dart';

@freezed
class RequestUpdateProfile with _$RequestUpdateProfile {
  factory RequestUpdateProfile({
    String? birthday,
    String? agency_name,
    String? address,
    String? name,
    String? phone,
    String? email,
  }) = _RequestUpdateProfile;

  factory RequestUpdateProfile.fromJson(Map<String, dynamic> json) => _$RequestUpdateProfileFromJson(json);
}
