// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCategory _$_$_ProductCategoryFromJson(Map<String, dynamic> json) {
  return _$_ProductCategory(
    image: json['image'] as String?,
    updated_at: json['updated_at'] as String?,
    image_path: json['image_path'] as String?,
    image_url: json['image_url'] as String?,
    name: json['name'] as String?,
    created_at: json['created_at'] as String?,
    id: json['id'] as int?,
    slug: json['slug'] as String?,
  );
}

Map<String, dynamic> _$_$_ProductCategoryToJson(_$_ProductCategory instance) =>
    <String, dynamic>{
      'image': instance.image,
      'updated_at': instance.updated_at,
      'image_path': instance.image_path,
      'image_url': instance.image_url,
      'name': instance.name,
      'created_at': instance.created_at,
      'id': instance.id,
      'slug': instance.slug,
    };
