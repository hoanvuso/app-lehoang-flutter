// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_search_history_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestSearchHistoryPoint _$_$_RequestSearchHistoryPointFromJson(
    Map<String, dynamic> json) {
  return _$_RequestSearchHistoryPoint(
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    search: json['search'] as String?,
    start_date: json['start_date'] as String?,
    end_date: json['end_date'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestSearchHistoryPointToJson(
        _$_RequestSearchHistoryPoint instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'search': instance.search,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'type': instance.type,
    };
