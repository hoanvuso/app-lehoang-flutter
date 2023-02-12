import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_search_product_company.freezed.dart';

part 'request_search_product_company.g.dart';

@freezed
class RequestSearchProductCompany with _$RequestSearchProductCompany {
  factory RequestSearchProductCompany({
    int? limit,
    int? page,
    String? keywords,
  }) = _RequestSearchProductCompany;

  factory RequestSearchProductCompany.fromJson(Map<String, dynamic> json) =>
      _$RequestSearchProductCompanyFromJson(json);

  RequestSearchProductCompany._();

  String getQuerySearch() {
    return 'trademarks?${page != null ? '&page=${page}' : ''}'
        '${limit != null ? '&limit=${limit}' : ''}'
        '${keywords != null ? '&keywords=${keywords}' : ''}';
  }
}
