import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppColor { colorPrimary, colorRed, colorBlue, colorYellow, colorGreen }

enum NoteType { TYPE_NORMAL, TYPE_IMPORTANT, TYPE_PASSWORD }

@immutable
class Constants {
  // static const String endpoint = "http://dicar.vn/api/";

  // static const String endpoint = "http://lehoang.hoanvusolutions.com.vn/api/v1/";
  static const String endpoint = "http://45.117.171.8/api/v1/";

  static const String CHANNEL_ID = "flutter_lehoang_extracare_channel_id";
  static const String CHANNEL_NAME = "LeHoang CCTV";
  static const String CHANNEL_DESCRIPTION = "LeHoang CCTV notifications";

  // static const String apiKey;
  static const String googleMapKey = "AIzaSyDkKiUcvQhtxKkEysAIt0w-69XTkAE1vNY";
  static const bool isTestUIAuth = false;
  static const bool isTestImage = false;

  static const String NEW_TYPE_PROMOTION = 'promotion';
  static const String NEW_TYPE_TECH = 'tech';
  static const String NEW_TYPE_DEFAULT = 'default';

  // static const bool testPostCar = false;
  static const int page_size = 10;


  static const String pageSplash = '/pageSplash';
  static const String pageLogin = '/pageLogin';
  static const String pageRegister = '/pageRegister';
  static const String pageRegisterVerify = '/pageRegisterVerify';
  static const String pageForgotPassPhone = '/pageForgotPassPhone';
  static const String pageForgotPassOtp = '/pageForgotPassOtp';
  static const String pageForgotPassChange = '/pageForgotPassChange';

  static const String pageProfile = '/pageProfile';
  static const String pageProfileUpdate = '/pageProfileUpdate';
  static const String pageProfileChangePassword = '/pageProfileChangePassword';
  static const String pageProfileQrCode = '/pageProfileQrCode';
  static const String pageHistoryGift = '/pageHistoryGift';
  static const String pageHistoryPoint = '/pageHistoryPoint';

  static const String pageGiftList = '/pageGiftList';
  static const String pageGiftDetail = '/pageGiftDetail';


  static const String pageMaster = '/pageMaster';
  static const String pageHome = '/pageHome';

  static const String pageProductCompany = '/pageProductCompany';
  static const String pageProductCategory = '/pageProductCategory';
  static const String pageProductCategoryChild = '/pageProductCategoryChild';
  static const String pageProductList = '/pageProductList';
  static const String pageProductDetail = '/pageProductDetail';
  static const String pageProductCompare = '/pageProductCompare';

  static const String pageNews = '/pageNews';
  static const String pageNewsDetail = '/pageNewsDetail';
  static const String pageNotificationAdminDetail = '/pageNotificationAdminDetail';
  static const String pagePromotion = '/pagePromotion';
  static const String pageTech = '/pageTech';

  static const String pageScanCode = '/pageScanCode';
  static const String pageIntroduce = '/pageIntroduce';
  static const String pageChallenge = '/pageChallenge';
  static const String pageNotifications = '/pageNotifications';
  static const String pageContact = '/pageContact';

  static const String pageSupport = '/pageSupport';
  static const String pageSupportSolution = '/pageSupportSolution';
  static const String pageSupportSolutionDetail = '/pageSupportSolutionDetail';
  static const String pageSupportQuestion = '/pageSupportQuestion';
  static const String pageSupportCatologue = '/pageSupportCatologue';
  static const String pageSupportDocument = '/pageSupportDocument';
  static const String pageSupportDocumentDetail = '/pageSupportDocumentDetail';
}
