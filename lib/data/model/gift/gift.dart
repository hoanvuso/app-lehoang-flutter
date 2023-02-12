import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift.freezed.dart';

part 'gift.g.dart';

@freezed
class Gift with _$Gift {
  factory Gift({
    String? image_url,
    int? is_active,
    Object? updated_at,
    Object? image_path,
    String? name,
    Object? created_at,
    int? id,
    int? point,
    int? qty, //tổng số đã đổi
    int? qty_used, //tổng số còn lại
    String? description,
  }) = _Gift;

  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);
}
