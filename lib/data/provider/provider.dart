import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/splite/app_database.dart';
import 'package:flutter_lehoang_extracare/data/local/splite/database_provider.dart';
import 'package:flutter_lehoang_extracare/data/network/app_dio.dart';
import 'package:flutter_lehoang_extracare/data/network/dio_provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter_lehoang_extracare/data/repository/challenge/challenge_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/challenge/challenge_repository_impl.dart';
import 'package:flutter_lehoang_extracare/data/repository/gift/gift_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/gift/gift_repository_impl.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository_impl.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/product/product_repository_impl.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider =
    Provider<DioProvider>((ref) => DioProvider(dio: AppDio.getInstance(), prefsProvider: ref.read(prefsProvider)));

final databaseProvider = Provider<DatabaseProvider>((ref) => DatabaseProvider(AppDatabase.getInstance()));

final prefsProvider = Provider<PrefsProvider>((ref) => PrefsProvider());

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepositoryImpl(
    databaseProvider: ref.read(databaseProvider),
    prefsProvider: ref.read(prefsProvider),
    dioProvider: ref.read(dioProvider)));

final productRepositoryProvider = Provider<ProductRepository>((ref) => ProductRepositoryImpl(
    databaseProvider: ref.read(databaseProvider),
    prefsProvider: ref.read(prefsProvider),
    dioProvider: ref.read(dioProvider)));

final newsRepositoryProvider = Provider<NewsRepository>((ref) => NewsRepositoryImpl(
    databaseProvider: ref.read(databaseProvider),
    prefsProvider: ref.read(prefsProvider),
    dioProvider: ref.read(dioProvider)));

final supportRepositoryProvider = Provider<SupportRepository>((ref) => SupportRepositoryImpl(
    databaseProvider: ref.read(databaseProvider),
    prefsProvider: ref.read(prefsProvider),
    dioProvider: ref.read(dioProvider)));

final giftRepositoryProvider = Provider<GiftRepository>((ref) => GiftRepositoryImpl(
    databaseProvider: ref.read(databaseProvider),
    prefsProvider: ref.read(prefsProvider),
    dioProvider: ref.read(dioProvider)));

final challengerRepositoryProvider = Provider<ChallengeRepository>((ref) => ChallengeRepositoryImpl(
    databaseProvider: ref.read(databaseProvider),
    prefsProvider: ref.read(prefsProvider),
    dioProvider: ref.read(dioProvider)));
