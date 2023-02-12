// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_scan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseScan _$_$_ResponseScanFromJson(Map<String, dynamic> json) {
  return _$_ResponseScan(
    code_string: json['code_string'] as String?,
    item_type: json['item_type'] as String?,
    created_at: json['created_at'] as String?,
    type: json['type'] as int?,
    message: json['message'] as String?,
    product_name: json['product_name'] as String?,
    point: json['point'],
    code_id: json['code_id'] as int?,
    category_id: json['category_id'],
    updated_at: json['updated_at'] as String?,
    user_id: json['user_id'] as int?,
    product_id: json['product_id'] as int?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$_$_ResponseScanToJson(_$_ResponseScan instance) =>
    <String, dynamic>{
      'code_string': instance.code_string,
      'item_type': instance.item_type,
      'created_at': instance.created_at,
      'type': instance.type,
      'message': instance.message,
      'product_name': instance.product_name,
      'point': instance.point,
      'code_id': instance.code_id,
      'category_id': instance.category_id,
      'updated_at': instance.updated_at,
      'user_id': instance.user_id,
      'product_id': instance.product_id,
      'id': instance.id,
    };
