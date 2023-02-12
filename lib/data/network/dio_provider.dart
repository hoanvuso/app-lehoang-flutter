import 'package:dio/dio.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_response.dart';
import 'package:flutter_lehoang_extracare/data/model/config/common_banner.dart';
import 'package:flutter_lehoang_extracare/data/model/config/setting_object.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/model/news/unread_news_count.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category_feature.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_point.dart';
import 'package:flutter_lehoang_extracare/data/model/question/challenge_help.dart';
import 'package:flutter_lehoang_extracare/data/model/question/response_answer.dart';
import 'package:flutter_lehoang_extracare/data/model/question/survey.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_answer.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_password.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_exchange_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_login.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_register.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_scan_product.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_history_point.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_news.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_product_company.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile_image.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_verify.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_verify_otp_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/model/scan/response_scan.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catalogue.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catologue_image.dart';
import 'package:flutter_lehoang_extracare/data/model/support/contact.dart';
import 'package:flutter_lehoang_extracare/data/model/support/introduce.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';

import '../local/pref/shared_preferences_provider.dart';

class DioProvider {
  DioProvider({required Dio dio, required PrefsProvider prefsProvider})
      : _dio = dio,
        _prefsProvider = prefsProvider {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options) {
      final token = _prefsProvider.getBearerToken();
      options.headers["Authorization"] = "Bearer $token";
      return options;
    }));
  }

  final Dio _dio;
  final PrefsProvider _prefsProvider;

  // Future<BaseResponse<List<Shop>>> loadShopList(RequestSearchShop request) =>
  //     _dio.get(request.getQuerySearch()).then((response) => BaseResponse.fromJson(response.data['data'], (json) {
  //           return (json as List<dynamic>).map((data) => Shop.fromJson(data)).toList();
  //         }));
  //
  //
  // Future<BaseResponse<String?>> loadBigFoodWebUrl() =>
  //     _dio.get("config/link_web").then((response) => BaseResponse.fromJson(response.data, (json) => json as String));
  //
  // Future<BaseResponse<String?>> loadBigFoodRegisterUrl() => _dio
  //     .get("config/link_register")
  //     .then((response) => BaseResponse.fromJson(response.data, (json) => json as String));
  //
  // Future<BaseResponse<dynamic>> createOrder(RequestCreateOrder request) => _dio
  //     .post("orders", data: request.toJson())
  //     .then((response) => BaseResponse.fromJson(response.data, (json) => json));
  //

  Future<BaseResponse> deleteAccount() => _dio
      .delete("me")
      .then((res) => BaseResponse.fromJson(res.data, (d) => d));

  Future<BaseResponse<User?>> login(RequestLogin request) => _dio
      .post("login", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => User.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<dynamic>> requestOtpForgotPass(RequestForgotPass request) => _dio
      .post("forgot-password", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => json));

  Future<BaseResponse<dynamic>> register(RequestRegister request) => _dio
      .post("register", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => json));

  Future<BaseResponse<User?>> verifyOtpRegister(RequestVerify request) => _dio
      .post("verify-code", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => User.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<dynamic>> verifyOtpForgotPass(RequestVerifyOtpForgotPass request) => _dio
      .post("verify-password", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => json));

  Future<BaseResponse<User?>> changePassForgot(RequestChangeForgotPass request) => _dio
      .post("reset-password", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => User.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<User?>> loadProfile() => _dio
      .get("me")
      .then((response) => BaseResponse.fromJson(response.data, (json) => User.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<User?>> updateProfile(RequestUpdateProfile request) => _dio
      .put("me", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => User.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<User?>> updateProfileImage(RequestUpdateProfileImage request) async {
    var data = await request.toFormData();
    return await _dio.post('update-avatar', data: data).then(
        (response) => BaseResponse.fromJson(response.data, (json) => User.fromJson(json as Map<String, dynamic>)));
  }

  Future<BaseResponse<User?>> changePassword(RequestChangePassword request) => _dio
      .post("update-password", data: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => User.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<List<NewObject>?>> loadNews(RequestSearchNews request) =>
      _dio.get(request.getQuerySearch()).then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => NewObject.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<CommonBanner>?>> loadCommonBanners() =>
      _dio.get("banners").then((response) => BaseResponse.fromJson(response.data, (json) {
            return (json as List<dynamic>).map((data) => CommonBanner.fromJson(data)).toList();
          }));

  Future<BaseResponse<NewObject?>> loadNewsDetail(int id) => _dio.get("news/$id").then(
      (response) => BaseResponse.fromJson(response.data, (json) => NewObject.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<UnreadNewsCount?>> loadUnreadNewsCount() => _dio.get("news-unread").then((response) =>
      BaseResponse.fromJson(response.data, (json) => UnreadNewsCount.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<List<Gift>?>> loadGifts(BaseRequest request) => _dio
      .get("gifts", queryParameters: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => Gift.fromJson(data)).toList();
          }));

  Future<BaseResponse<dynamic>> exchangeGift(int id, RequestExchangeGift requestExchangeGift) => _dio
      .post("gifts/$id/exchange", data: requestExchangeGift.toJson())
      .then((response) => BaseResponse.fromJson(response.data, (json) => json));

  Future<BaseResponse<ResponseScan?>> scanProduct(RequestScanProduct request) =>
      _dio.post("scan-product", data: request.toJson()).then((response) =>
          BaseResponse.fromJson(response.data, (json) => ResponseScan.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<List<HistoryGift>?>> loadHistoryGifts(RequestSearchHistoryGift request) =>
      _dio.get(request.getQuerySearch()).then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => HistoryGift.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<HistoryPoint>?>> loadHistoryPoints(RequestSearchHistoryPoint request) =>
      _dio.get(request.getQuerySearch()).then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => HistoryPoint.fromJson(data)).toList();
          }));

  Future<BaseResponse<Survey?>> loadQuestion() => _dio.get("survey-question").then(
      (response) => BaseResponse.fromJson(response.data, (json) => Survey.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<ChallengeHelp?>> loadChallengeHelp() => _dio.get("page/10").then((response) =>
      BaseResponse.fromJson(response.data, (json) => ChallengeHelp.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<ResponseAnswer?>> sendAnswerChallenge(RequestAnswer request) =>
      _dio.post("survey-attempt", data: request.toJson()).then((response) =>
          BaseResponse.fromJson(response.data, (json) => ResponseAnswer.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<List<ProductCompany>?>> loadProductCompanies(RequestSearchProductCompany request) =>
      _dio.get(request.getQuerySearch()).then((response) => BaseResponse.fromJson(response.data, (json) {
            return (json as List<dynamic>).map((data) => ProductCompany.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<ProductCategory>?>> loadProductCategorys(RequestSearchProductCategory request) =>
      _dio.get(request.getQuerySearch()).then((response) => BaseResponse.fromJson(response.data, (json) {
            return (json as List<dynamic>).map((data) => ProductCategory.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<Product>?>> loadProducts(RequestSearchProduct request) =>
      _dio.get(request.getQuerySearch()).then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => Product.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<ProductCategoryFeature>?>> loadCategoryFeatures(int id) =>
      _dio.get("category-specifications/$id").then((response) => BaseResponse.fromJson(response.data, (json) {
            return (json as List<dynamic>).map((data) => ProductCategoryFeature.fromJson(data)).toList();
          }));

  Future<BaseResponse<Introduce?>> loadIntroduce() => _dio.get("page/1").then(
      (response) => BaseResponse.fromJson(response.data, (json) => Introduce.fromJson(json as Map<String, dynamic>)));

  Future<BaseResponse<List<SupportObject>?>> loadFrequentlyQuestion(BaseRequest request) => _dio
      .get("page-type/qa", queryParameters: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => SupportObject.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<SupportObject>?>> loadSolutions(BaseRequest request) => _dio
      .get("page-type/solution", queryParameters: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => SupportObject.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<SupportObject>?>> loadDocuments(BaseRequest request) => _dio
      .get("page-type/document", queryParameters: request.toJson())
      .then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => SupportObject.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<SettingObject>?>> loadSettings() =>
      _dio.get("settings").then((response) => BaseResponse.fromJson(response.data, (json) {
            return (json as List<dynamic>).map((data) => SettingObject.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<Contact>?>> loadContacts() =>
      _dio.get("contact-address").then((response) => BaseResponse.fromJson(response.data, (json) {
            return (json as List<dynamic>).map((data) => Contact.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<Catalogue>?>> loadCatalogueList() =>
      _dio.get("catalogues?limit=999").then((response) => BaseResponse.fromJson(response.data['data'], (json) {
            return (json as List<dynamic>).map((data) => Catalogue.fromJson(data)).toList();
          }));

  Future<BaseResponse<List<CatologueImage>?>> loadCatologueImages(int? id) =>
      _dio.get("catalogues/$id").then((response) => BaseResponse.fromJson(response.data, (json) {
            return (json as List<dynamic>).map((data) => CatologueImage.fromJson(data)).toList();
          }));
}
