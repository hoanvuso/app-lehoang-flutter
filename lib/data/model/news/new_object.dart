import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_object.freezed.dart';

part 'new_object.g.dart';

@freezed
class NewObject with _$NewObject {
  factory NewObject({
    Object? image,
    Object? updated_at,
    Object? image_path,
    int? ordering,
    String? image_url,
    String? name,
    String? created_at,
    int? id,
    String? short_body,
    String? body,
    String? type,
    int? was_read_count,
  }) = _NewObject;

  factory NewObject.fromJson(Map<String, dynamic> json) => _$NewObjectFromJson(json);
}
