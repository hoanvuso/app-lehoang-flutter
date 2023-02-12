import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_search_history_point.freezed.dart';

part 'request_search_history_point.g.dart';

@freezed
class RequestSearchHistoryPoint with _$RequestSearchHistoryPoint {
  factory RequestSearchHistoryPoint({
    int? limit,
    int? page,
    String? search,
    String? start_date,
    String? end_date,
    String? type, //Nếu là load lịch sử điểm trừ thì type = withdraw
  }) = _RequestSearchHistoryPoint;

  factory RequestSearchHistoryPoint.fromJson(Map<String, dynamic> json) => _$RequestSearchHistoryPointFromJson(json);

  RequestSearchHistoryPoint._();

  String getQuerySearch() {
    return 'wallets?type=earning${limit != null ? '&limit=${limit}' : ''}'
        '${page != null ? '&page=${page}' : ''}'
        '${search != null ? '&search=${search}' : ''}'
        '${type != null ? '&type=${type}' : ''}'
        '${start_date != null ? '&start_date=${start_date}' : ''}'
        '${end_date != null ? '&end_date=${end_date}' : ''}';
  }
}
