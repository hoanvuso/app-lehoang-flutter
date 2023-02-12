// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_search_history_gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestSearchHistoryGift _$_$_RequestSearchHistoryGiftFromJson(
    Map<String, dynamic> json) {
  return _$_RequestSearchHistoryGift(
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    search: json['search'] as String?,
    start_date: json['start_date'] as String?,
    end_date: json['end_date'] as String?,
  );
}

Map<String, dynamic> _$_$_RequestSearchHistoryGiftToJson(
        _$_RequestSearchHistoryGift instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'search': instance.search,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
    };
