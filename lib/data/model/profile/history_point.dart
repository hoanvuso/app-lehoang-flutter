import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_point.freezed.dart';

part 'history_point.g.dart';

@freezed
class HistoryPoint with _$HistoryPoint {
  factory HistoryPoint({
    Object? gift,
    String? code_string,
    Object? item_id,
    String? item_type,
    String? created_at,
    int? type,
    String? message,
    String? product_name,
    int? code_id,
    int? point,
    Object? category_id,
    String? updated_at,
    int? user_id,
    int? product_id,
    int? id,
    String? group,
  }) = _HistoryPoint;

  factory HistoryPoint.fromJson(Map<String, dynamic> json) => _$HistoryPointFromJson(json);
}
