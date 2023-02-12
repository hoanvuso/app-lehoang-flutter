import 'package:freezed_annotation/freezed_annotation.dart';

part 'catologue_image.freezed.dart';

part 'catologue_image.g.dart';

@freezed
class CatologueImage with _$CatologueImage {
  factory CatologueImage({
    Object? image,
    int? catalogue_id,
    Object? updated_at,
    int? ordering,
    String? image_url,
    String? name,
    Object? created_at,
    int? id,
  }) = _CatologueImage;

  factory CatologueImage.fromJson(Map<String, dynamic> json) => _$CatologueImageFromJson(json);
}
