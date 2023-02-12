import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/local/splite/database_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_point.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_password.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_login.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_register.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_search_history_point.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile_image.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_verify.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_verify_otp_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/data/network/dio_provider.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
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
  Future<Result> deleteAccount() =>Result.guardFuture(() async {
    final baseResponse = await _dioProvider.deleteAccount();
    return baseResponse;
  });

  @override
  Future<Result<List<HistoryGift>?>> loadHistoryGift(RequestSearchHistoryGift request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.loadHistoryGifts(request);
        return baseResponse.data;
      });

  @override
  Future<Result<List<HistoryPoint>?>> loadHistoryPoint(RequestSearchHistoryPoint request)=> Result.guardFuture(() async {
    final baseResponse = await _dioProvider.loadHistoryPoints(request);
    return baseResponse.data;
  });

  @override
  Future<Result<User?>> login(RequestLogin request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.login(request);
        return baseResponse.data;
      });

  @override
  Future<Result> register(RequestRegister request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.register(request);
        return baseResponse.data;
      });

  @override
  Future<Result<User?>> verifyOtpRegister(RequestVerify request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.verifyOtpRegister(request);
        return baseResponse.data;
      });

  @override
  Future<Result<User?>> loadProfile() => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.loadProfile();
    return baseResponse.data;
  });

  @override
  Future<Result<User?>> updateProfile(RequestUpdateProfile request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.updateProfile(request);
        return baseResponse.data;
      });

  @override
  Future<Result<User?>> updateProfileImage(RequestUpdateProfileImage request) => Result.guardFuture(() async {
        final baseResponse = await _dioProvider.updateProfileImage(request);
        return baseResponse.data;
      });

  @override
  Future<Result<User?>> changePassword(RequestChangePassword request) => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.changePassword(request);
    return baseResponse.data;
  });

  @override
  Future<Result> requestOtpForgotPass(RequestForgotPass request) => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.requestOtpForgotPass(request);
    return baseResponse.data;
  });

  @override
  Future<Result> verifyOtpForgotPass(RequestVerifyOtpForgotPass request) => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.verifyOtpForgotPass(request);
    return baseResponse.data;
  });

  @override
  Future<Result<User?>> changeForgotPass(RequestChangeForgotPass request) => Result.guardFuture(() async {
    final baseResponse = await _dioProvider.changePassForgot(request);
    return baseResponse.data;
  });

// @override
// Future<Result<ResponseLogin?>> login(RequestLogin request) => Result.guardFuture(() async {
//   final baseResponse = await _dioProvider.login(request);
//   return baseResponse.data;
// });
//
// @override
// Future<Result<User?>> register(RequestRegister request) => Result.guardFuture(() async {
//   final baseResponse = await _dioProvider.register(request);
//   return baseResponse.data;
// });
}
