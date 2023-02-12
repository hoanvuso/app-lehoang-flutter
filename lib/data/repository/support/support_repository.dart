import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/config/setting_object.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catalogue.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catologue_image.dart';
import 'package:flutter_lehoang_extracare/data/model/support/contact.dart';
import 'package:flutter_lehoang_extracare/data/model/support/introduce.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';

abstract class SupportRepository {
  Future<Result<Introduce?>> loadIntroduce();

  Future<Result<List<SupportObject>?>> loadFrequentlyQuestion(BaseRequest request);

  Future<Result<List<SupportObject>?>> loadSolutions(BaseRequest request);

  Future<Result<List<SupportObject>?>> loadDocuments(BaseRequest request);

  Future<Result<List<SettingObject>?>> loadSettings();

  Future<Result<List<Contact>?>> loadContacts();

  Future<Result<List<Catalogue>?>> loadCatalogueList();

  //1 bac , 2 trung, 3 nam
  Future<Result<List<CatologueImage>?>> loadCatologueImages(int? id);
}
