// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCategoryFeature _$_$_ProductCategoryFeatureFromJson(
    Map<String, dynamic> json) {
  return _$_ProductCategoryFeature(
    category_id: json['category_id'] as int?,
    updated_at: json['updated_at'] as String?,
    name: json['name'] as String?,
    created_at: json['created_at'] as String?,
    id: json['id'] as int?,
    slug: json['slug'] as String?,
  );
}

Map<String, dynamic> _$_$_ProductCategoryFeatureToJson(
        _$_ProductCategoryFeature instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'updated_at': instance.updated_at,
      'name': instance.name,
      'created_at': instance.created_at,
      'id': instance.id,
      'slug': instance.slug,
    };
