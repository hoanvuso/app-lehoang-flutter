// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BaseRequest _$_$_BaseRequestFromJson(Map<String, dynamic> json) {
  return _$_BaseRequest(
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    search: json['search'] as String?,
  );
}

Map<String, dynamic> _$_$_BaseRequestToJson(_$_BaseRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'search': instance.search,
    };
