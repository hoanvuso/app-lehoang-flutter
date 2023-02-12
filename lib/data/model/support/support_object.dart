import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_object.freezed.dart';

part 'support_object.g.dart';

@freezed
class SupportObject with _$SupportObject {
  factory SupportObject({
    Object? image,
    String? image_url,
    String? document_file,
    String? created_at,
    Object? short_body,
    String? body,
    String? type,
    Object? updated_at,
    Object? content_type,
    Object? image_path,
    String? name,
    int? id,
    String? slug,
    List<String>? list_images,
  }) = _SupportObject;

  factory SupportObject.fromJson(Map<String, dynamic> json) => _$SupportObjectFromJson(json);
}
