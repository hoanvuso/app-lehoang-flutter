// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gift _$_$_GiftFromJson(Map<String, dynamic> json) {
  return _$_Gift(
    image_url: json['image_url'] as String?,
    is_active: json['is_active'] as int?,
    updated_at: json['updated_at'],
    image_path: json['image_path'],
    name: json['name'] as String?,
    created_at: json['created_at'],
    id: json['id'] as int?,
    point: json['point'] as int?,
    qty: json['qty'] as int?,
    qty_used: json['qty_used'] as int?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$_$_GiftToJson(_$_Gift instance) => <String, dynamic>{
      'image_url': instance.image_url,
      'is_active': instance.is_active,
      'updated_at': instance.updated_at,
      'image_path': instance.image_path,
      'name': instance.name,
      'created_at': instance.created_at,
      'id': instance.id,
      'point': instance.point,
      'qty': instance.qty,
      'qty_used': instance.qty_used,
      'description': instance.description,
    };
