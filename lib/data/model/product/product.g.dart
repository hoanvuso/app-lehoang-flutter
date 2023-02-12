// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return _$_Product(
    image_url: json['image_url'] as String?,
    short_body: json['short_body'] as String?,
    serial_code: json['serial_code'] as String?,
    ordering: json['ordering'] as int?,
    description: json['description'] as String?,
    created_at: json['created_at'],
    specifications: json['specifications'] as String?,
    point: json['point'] as int?,
    updated_at: json['updated_at'],
    category_id: json['category_id'],
    image_path: json['image_path'],
    name: json['name'] as String?,
    model: json['model'] as String?,
    id: json['id'] as int?,
    price: json['price'] as int?,
    material_code: json['material_code'] as String?,
    tech_infomations: (json['tech_infomations'] as List<dynamic>?)
        ?.map((e) => ProductTechInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'image_url': instance.image_url,
      'short_body': instance.short_body,
      'serial_code': instance.serial_code,
      'ordering': instance.ordering,
      'description': instance.description,
      'created_at': instance.created_at,
      'specifications': instance.specifications,
      'point': instance.point,
      'updated_at': instance.updated_at,
      'category_id': instance.category_id,
      'image_path': instance.image_path,
      'name': instance.name,
      'model': instance.model,
      'id': instance.id,
      'price': instance.price,
      'material_code': instance.material_code,
      'tech_infomations': instance.tech_infomations,
    };
