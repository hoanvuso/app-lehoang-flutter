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

abstract class AuthRepository {

  Future<Result> deleteAccount();

  Future<Result<User?>> login(RequestLogin request);

  Future<Result<dynamic>> register(RequestRegister request);

  Future<Result<User?>> verifyOtpRegister(RequestVerify request);

  Future<Result<dynamic>> requestOtpForgotPass(RequestForgotPass request);

  Future<Result<dynamic>> verifyOtpForgotPass(RequestVerifyOtpForgotPass request);

  Future<Result<User?>> changeForgotPass(RequestChangeForgotPass request);

  Future<Result<User?>> loadProfile();

  Future<Result<User?>> updateProfile(RequestUpdateProfile request);

  Future<Result<User?>> updateProfileImage(RequestUpdateProfileImage request);

  Future<Result<User?>> changePassword(RequestChangePassword request);

  Future<Result<List<HistoryGift>?>> loadHistoryGift(RequestSearchHistoryGift request);

  Future<Result<List<HistoryPoint>?>> loadHistoryPoint(RequestSearchHistoryPoint request);
}
