// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_search_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestSearchProduct _$_$_RequestSearchProductFromJson(
    Map<String, dynamic> json) {
  return _$_RequestSearchProduct(
    category_id: json['category_id'] as int?,
    trademark_id: json['trademark_id'] as int?,
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    is_new: json['is_new'] as int?,
    keywords: json['keywords'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestSearchProductToJson(
        _$_RequestSearchProduct instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'trademark_id': instance.trademark_id,
      'limit': instance.limit,
      'page': instance.page,
      'is_new': instance.is_new,
      'keywords': instance.keywords,
    };
