// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommonBanner _$_$_CommonBannerFromJson(Map<String, dynamic> json) {
  return _$_CommonBanner(
    image: json['image'] as String?,
    is_active: json['is_active'] as int?,
    updated_at: json['updated_at'] as String?,
    ordering: json['ordering'] as int?,
    image_path: json['image_path'] as String?,
    image_url: json['image_url'] as String?,
    created_at: json['created_at'] as String?,
    id: json['id'] as int?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$_$_CommonBannerToJson(_$_CommonBanner instance) =>
    <String, dynamic>{
      'image': instance.image,
      'is_active': instance.is_active,
      'updated_at': instance.updated_at,
      'ordering': instance.ordering,
      'image_path': instance.image_path,
      'image_url': instance.image_url,
      'created_at': instance.created_at,
      'id': instance.id,
      'title': instance.title,
    };
