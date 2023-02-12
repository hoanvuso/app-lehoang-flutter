import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/splite/database_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/config/common_banner.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/model/news/unread_news_count.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_news.dart';
import 'package:flutter_lehoang_extracare/data/network/dio_provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(
      {required DatabaseProvider databaseProvider,
      required PrefsProvider prefsProvider,
      required DioProvider dioProvider})
      : _databaseProvider = databaseProvider,
        _dioProvider = dioProvider,
        _prefsProvider = prefsProvider;

  final DatabaseProvider _databaseProvider;
  final DioProvider _dioProvider;
  final PrefsProvider _prefsProvider;

  @override
  Future<Result<List<NewObject>?>> loadNews(RequestSearchNews request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadNews(request);
        return baseResponse.data;
      });

  @override
  Future<Result<NewObject?>> loadDetailNew(int id) => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.loadNewsDetail(id);
    return baseResponse.data;
  });

  @override
  Future<Result<UnreadNewsCount?>> loadUnreadNewsCount() => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadUnreadNewsCount();
        return baseResponse.data;
      });

  @override
  Future<Result<List<CommonBanner>?>> loadCommonBanners()  => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.loadCommonBanners();
    return baseResponse.data;
  });
}
