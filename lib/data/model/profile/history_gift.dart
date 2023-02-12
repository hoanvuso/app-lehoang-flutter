import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_gift.freezed.dart';

part 'history_gift.g.dart';

@freezed
class HistoryGift with _$HistoryGift {
  factory HistoryGift({
    Gift? gift,
    Object? customer_address,
    Object? lng,
    int? have_sent,
    int? gift_id,
    String? created_at,
    int? point,
    int? is_deleted,
    String? updated_at,
    int? user_id,
    String? phone,
    String? gift_name,
    int? id,
    Object? customer_name,
    Object? lat,
    int? status,
  }) = _HistoryGift;

  factory HistoryGift.fromJson(Map<String, dynamic> json) => _$HistoryGiftFromJson(json);

  HistoryGift._();

  String getStatusString() {
    switch(status) {
      case 0:
        return 'Chờ duyệt';
      case 1:
        return 'Thành công';
      default:
        return 'status $status';
    }
  }
}
