import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_search_history_gift.freezed.dart';

part 'request_search_history_gift.g.dart';

@freezed
class RequestSearchHistoryGift with _$RequestSearchHistoryGift {
  factory RequestSearchHistoryGift({
    int? limit,
    int? page,
    String? search,
    String? start_date,
    String? end_date,
  }) = _RequestSearchHistoryGift;

  factory RequestSearchHistoryGift.fromJson(Map<String, dynamic> json) => _$RequestSearchHistoryGiftFromJson(json);

  RequestSearchHistoryGift._();

  String getQuerySearch() {
    return 'gift-exchange-histories?${limit != null ? 'limit=${limit}' : ''}'
        '${page != null ? '&page=${page}' : ''}'
        '${search != null ? '&search=${search}' : ''}'
        '${start_date != null ? '&start_date=${start_date}' : ''}'
        '${end_date != null ? '&end_date=${end_date}' : ''}';
  }
}
