import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduce.freezed.dart';

part 'introduce.g.dart';

@freezed
class Introduce with _$Introduce {
  factory Introduce({
    String? image,
    String? image_url,
    String? created_at,
    String? short_body,
    String? body,
    Object? type,
    String? updated_at,
    String? content_type,
    String? image_path,
    String? name,
    int? id,
    Object? document_file,
    String? slug,
  }) = _Introduce;

  factory Introduce.fromJson(Map<String, dynamic> json) => _$IntroduceFromJson(json);
}
