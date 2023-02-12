// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryGift _$_$_HistoryGiftFromJson(Map<String, dynamic> json) {
  return _$_HistoryGift(
    gift: json['gift'] == null
        ? null
        : Gift.fromJson(json['gift'] as Map<String, dynamic>),
    customer_address: json['customer_address'],
    lng: json['lng'],
    have_sent: json['have_sent'] as int?,
    gift_id: json['gift_id'] as int?,
    created_at: json['created_at'] as String?,
    point: json['point'] as int?,
    is_deleted: json['is_deleted'] as int?,
    updated_at: json['updated_at'] as String?,
    user_id: json['user_id'] as int?,
    phone: json['phone'] as String?,
    gift_name: json['gift_name'] as String?,
    id: json['id'] as int?,
    customer_name: json['customer_name'],
    lat: json['lat'],
    status: json['status'] as int?,
  );
}

Map<String, dynamic> _$_$_HistoryGiftToJson(_$_HistoryGift instance) =>
    <String, dynamic>{
      'gift': instance.gift,
      'customer_address': instance.customer_address,
      'lng': instance.lng,
      'have_sent': instance.have_sent,
      'gift_id': instance.gift_id,
      'created_at': instance.created_at,
      'point': instance.point,
      'is_deleted': instance.is_deleted,
      'updated_at': instance.updated_at,
      'user_id': instance.user_id,
      'phone': instance.phone,
      'gift_name': instance.gift_name,
      'id': instance.id,
      'customer_name': instance.customer_name,
      'lat': instance.lat,
      'status': instance.status,
    };
