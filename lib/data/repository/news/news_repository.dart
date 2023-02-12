import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/config/common_banner.dart';
import 'package:flutter_lehoang_extracare/data/model/news/unread_news_count.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_news.dart';

abstract class NewsRepository {
  // //Load danh sách khuyến mãi ở màn home
  // Future<Result<List<NewObject>?>> loadHomePromotion();

  /*Load tin tức, có 2 loại:
  Khuyến mãi = promotion
  công nghệ = tech
  */
  Future<Result<List<NewObject>?>> loadNews(RequestSearchNews request);

  Future<Result<NewObject?>> loadDetailNew(int id);

  Future<Result<UnreadNewsCount?>> loadUnreadNewsCount();

  Future<Result<List<CommonBanner>?>> loadCommonBanners();
}
