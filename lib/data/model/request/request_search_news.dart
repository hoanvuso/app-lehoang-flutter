import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_search_news.freezed.dart';

part 'request_search_news.g.dart';

@freezed
class RequestSearchNews with _$RequestSearchNews {
  factory RequestSearchNews({
    String? type,
    int? limit,
    int? page,
    int? is_new,
    String? keywords,
  }) = _RequestSearchNews;

  factory RequestSearchNews.fromJson(Map<String, dynamic> json) => _$RequestSearchNewsFromJson(json);

  RequestSearchNews._();

  String getQuerySearch() {
    return 'news?${type != null ? 'type=${type}' : ''}'
        '${limit != null ? '&limit=${limit}' : ''}'
        '${page != null ? '&page=${page}' : ''}'
        '${is_new != null ? '&is_new=${is_new}' : ''}'
        '${keywords != null ? '&keywords=${keywords}' : ''}';
  }
}
