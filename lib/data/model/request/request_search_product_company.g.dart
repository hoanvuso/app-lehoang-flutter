// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_search_product_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestSearchProductCompany _$_$_RequestSearchProductCompanyFromJson(
    Map<String, dynamic> json) {
  return _$_RequestSearchProductCompany(
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    keywords: json['keywords'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestSearchProductCompanyToJson(
        _$_RequestSearchProductCompany instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'keywords': instance.keywords,
    };
