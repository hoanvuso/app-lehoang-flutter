import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/splite/database_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/config/setting_object.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catalogue.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catologue_image.dart';
import 'package:flutter_lehoang_extracare/data/model/support/contact.dart';
import 'package:flutter_lehoang_extracare/data/model/support/introduce.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/data/network/dio_provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';

class SupportRepositoryImpl implements SupportRepository {
  SupportRepositoryImpl(
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
  Future<Result<Introduce?>> loadIntroduce() {
    // final savedIntroduce = _prefsProvider.getIntroduce();
    // if (savedIntroduce != null) {
    //   return Result.guardFuture(() => Future.value(savedIntroduce));
    // } else {
    return Result.guardFuture(() async {
      final baseResponse = await _dioProvider.loadIntroduce();
      return baseResponse.data;
    });
    // }
  }

  @override
  Future<Result<List<SupportObject>?>> loadFrequentlyQuestion(BaseRequest request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadFrequentlyQuestion(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<SupportObject>?>> loadSolutions(BaseRequest request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadSolutions(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<SupportObject>?>> loadDocuments(BaseRequest request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadDocuments(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<SettingObject>?>> loadSettings() => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadSettings();
        return baseResponse.data;
      });

  @override
  Future<Result<List<Contact>?>> loadContacts() => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadContacts();
        return baseResponse.data;
      });

  @override
  Future<Result<List<CatologueImage>?>> loadCatologueImages(int? id) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadCatologueImages(id);
        return baseResponse.data;
      });

  @override
  Future<Result<List<Catalogue>?>> loadCatalogueList() => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.loadCatalogueList();
    return baseResponse.data;
  });
}
