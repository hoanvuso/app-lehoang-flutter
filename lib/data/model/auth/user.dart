import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    String? address,
    String? role,
    int? is_active,
    int? total_gift,
    String? avatarUrl,
    int? recent_point,
    String? created_at,
    Object? email_verified_at,
    Object? avatar,
    int? earning_point,
    String? token,
    String? reference,
    String? updated_at,
    String? rank,
    Object? password_change,
    int? id,
    String? name,
    String? email,
    String? birthday,
    String? username,
    String? agency_name,
    int? point_exchane,
    int? total_scan,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
