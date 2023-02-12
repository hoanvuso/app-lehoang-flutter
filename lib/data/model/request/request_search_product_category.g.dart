// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_search_product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestSearchProductCategory _$_$_RequestSearchProductCategoryFromJson(
    Map<String, dynamic> json) {
  return _$_RequestSearchProductCategory(
    category_id: json['category_id'] as int?,
    trademark_id: json['trademark_id'] as int?,
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    keywords: json['keywords'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestSearchProductCategoryToJson(
        _$_RequestSearchProductCategory instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'trademark_id': instance.trademark_id,
      'limit': instance.limit,
      'page': instance.page,
      'keywords': instance.keywords,
    };
