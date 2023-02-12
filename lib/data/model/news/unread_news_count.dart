import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_news_count.freezed.dart';

part 'unread_news_count.g.dart';

@freezed
class UnreadNewsCount with _$UnreadNewsCount {
  factory UnreadNewsCount({
    int? all,
    int? tech,
    int? active,
    int? promotion,
  }) = _UnreadNewsCount;

  factory UnreadNewsCount.fromJson(Map<String, dynamic> json) => _$UnreadNewsCountFromJson(json);
}
