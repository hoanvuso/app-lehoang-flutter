import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_object.freezed.dart';

part 'setting_object.g.dart';

@freezed
class SettingObject with _$SettingObject {
  factory SettingObject({
    Object? updated_at,
    Object? created_at,
    int? id,
    String? value,
    String? key,
    String? group,
  }) = _SettingObject;

  factory SettingObject.fromJson(Map<String, dynamic> json) => _$SettingObjectFromJson(json);
}
