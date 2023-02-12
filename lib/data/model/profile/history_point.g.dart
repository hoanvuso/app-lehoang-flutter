// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryPoint _$_$_HistoryPointFromJson(Map<String, dynamic> json) {
  return _$_HistoryPoint(
    gift: json['gift'],
    code_string: json['code_string'] as String?,
    item_id: json['item_id'],
    item_type: json['item_type'] as String?,
    created_at: json['created_at'] as String?,
    type: json['type'] as int?,
    message: json['message'] as String?,
    product_name: json['product_name'] as String?,
    code_id: json['code_id'] as int?,
    point: json['point'] as int?,
    category_id: json['category_id'],
    updated_at: json['updated_at'] as String?,
    user_id: json['user_id'] as int?,
    product_id: json['product_id'] as int?,
    id: json['id'] as int?,
    group: json['group'] as String?,
  );
}

Map<String, dynamic> _$_$_HistoryPointToJson(_$_HistoryPoint instance) =>
    <String, dynamic>{
      'gift': instance.gift,
      'code_string': instance.code_string,
      'item_id': instance.item_id,
      'item_type': instance.item_type,
      'created_at': instance.created_at,
      'type': instance.type,
      'message': instance.message,
      'product_name': instance.product_name,
      'code_id': instance.code_id,
      'point': instance.point,
      'category_id': instance.category_id,
      'updated_at': instance.updated_at,
      'user_id': instance.user_id,
      'product_id': instance.product_id,
      'id': instance.id,
      'group': instance.group,
    };
