// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_search_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestSearchNews _$_$_RequestSearchNewsFromJson(Map<String, dynamic> json) {
  return _$_RequestSearchNews(
    type: json['type'] as String?,
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    is_new: json['is_new'] as int?,
    keywords: json['keywords'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestSearchNewsToJson(
        _$_RequestSearchNews instance) =>
    <String, dynamic>{
      'type': instance.type,
      'limit': instance.limit,
      'page': instance.page,
      'is_new': instance.is_new,
      'keywords': instance.keywords,
    };
