import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/config/setting_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_page_route.dart';
import 'package:flutter_lehoang_extracare/ui/auth/forgotpass/change/forgot_pass_change_page.dart';
import 'package:flutter_lehoang_extracare/ui/auth/forgotpass/otp/forgot_pass_otp_page.dart';
import 'package:flutter_lehoang_extracare/ui/auth/forgotpass/phone/forgot_pass_phone_page.dart';
import 'package:flutter_lehoang_extracare/ui/auth/login/login_page.dart';
import 'package:flutter_lehoang_extracare/ui/auth/register/info/register_page.dart';
import 'package:flutter_lehoang_extracare/ui/auth/register/otp/register_verify_page.dart';
import 'package:flutter_lehoang_extracare/ui/challenge/challenge_page.dart';
import 'package:flutter_lehoang_extracare/ui/gift/detail/gift_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/gift/gift_list_page.dart';
import 'package:flutter_lehoang_extracare/ui/introduce/contact/contact_page.dart';
import 'package:flutter_lehoang_extracare/ui/introduce/intro/introduce_page.dart';
import 'package:flutter_lehoang_extracare/ui/master/master_page.dart';
import 'package:flutter_lehoang_extracare/ui/news/detail/news_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/notification/detailsystem/notification_system_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/notification/notification_page.dart';
import 'package:flutter_lehoang_extracare/ui/profile/changepass/change_pass_page.dart';
import 'package:flutter_lehoang_extracare/ui/profile/h%C3%ADtorypoint/history_point_page.dart';
import 'package:flutter_lehoang_extracare/ui/profile/historygift/history_gift_page.dart';
import 'package:flutter_lehoang_extracare/ui/profile/profile_page.dart';
import 'package:flutter_lehoang_extracare/ui/profile/qrcode/profile_qrcode_page.dart';
import 'package:flutter_lehoang_extracare/ui/profile/update/profile_update_page.dart';
import 'package:flutter_lehoang_extracare/ui/scancode/scan_code_page2.dart';
import 'package:flutter_lehoang_extracare/ui/support/catologue/catologue_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';

class AppSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: _loadData(context),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return App();
        }
      },
    );
  }

  Future<dynamic> _loadData(BuildContext context) {
    final supportRepository = context.read(supportRepositoryProvider);
    final pref = context.read(prefsProvider);
    return Future.wait([
      loadFCMDeviceToken(context),
      supportRepository.loadIntroduce().then((value) {
        final introduce = value.dataOrNull;
        if (introduce != null) {
          pref.saveIntroduce(introduce);
        }
      }),
      supportRepository.loadSettings().then((value) {
        if (value.dataOrNull != null) {
          List<SettingObject> settings = value.dataOrNull as List<SettingObject>;
          settings.forEach((element) {
            final key = element.key;
            switch (key) {
              case 'facebook':
                pref.saveFacebookValue(element.value);
                // pref.saveFacebookValue('https://www.facebook.com/manhtuan21/');
                break;
              case 'zalo':
                pref.saveZaloValue(element.value);
                // pref.saveZaloValue('0368179011');
                break;
              case 'hotline':
                pref.saveHotlineValue(element.value);
                // pref.saveHotlineValue('0368179011');
                break;
            }
          });
        }
      }),
    ]);
  }

  Future<dynamic> loadFCMDeviceToken(BuildContext context) {
    final fcmMessaging = FirebaseMessaging.instance;
    return fcmMessaging.getToken().then((token) {
      print("onTokenFCM: $token");
      if (token != null) {
        context.read(prefsProvider).saveDeviceToken(token);
        // context.read(masterPageViewModel).sendDeviceTokenToServer(token);
      }
    });

    // if (Platform.isAndroid) {
    //   final fcmMessaging = FirebaseMessaging.instance;
    //   return fcmMessaging.getToken().then((token) {
    //     print("onTokenFCM: $token");
    //     if (token != null) {
    //       context.read(prefsProvider).saveDeviceToken(token);
    //       // context.read(masterPageViewModel).sendDeviceTokenToServer(token);
    //     }
    //   });
    // } else {
    //   return Future.value();
    // }
  }
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final isLogged = context.read(prefsProvider).getUser() != null;
    return ScreenUtilInit(
      designSize: const Size(411, 683),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LEHOANG CCTV',
        // theme: lightTheme,
        // darkTheme: darkTheme,
        // themeMode: ThemeMode.light,
        // home: isLogged ? MasterPage() : LoginPage(),
        home: MasterPage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Constants.pageLogin:
              return BasePageRoute(settings: settings, builder: (context) => LoginPage());
            case Constants.pageRegister:
              return BasePageRoute(settings: settings, builder: (context) => RegisterPage());
            case Constants.pageRegisterVerify:
              return BasePageRoute(settings: settings, builder: (context) => RegisterVerifyPage());
            case Constants.pageForgotPassPhone:
              return BasePageRoute(settings: settings, builder: (context) => ForgotPassPhonePage());
            case Constants.pageForgotPassOtp:
              return BasePageRoute(settings: settings, builder: (context) => ForgotPassOtpPage());
            case Constants.pageForgotPassChange:
              return BasePageRoute(settings: settings, builder: (context) => ForgotPassChangePage());
            case Constants.pageMaster:
              return BasePageRoute(settings: settings, builder: (context) => MasterPage());
            case Constants.pageProfile:
              return BasePageRoute(settings: settings, builder: (context) => ProfilePage());
            case Constants.pageProfileUpdate:
              return BasePageRoute(settings: settings, builder: (context) => ProfileUpdatePage());
            case Constants.pageProfileChangePassword:
              return BasePageRoute(settings: settings, builder: (context) => ChangePassPage());
            case Constants.pageProfileQrCode:
              return BasePageRoute(settings: settings, builder: (context) => ProfileQrCodePage());
            case Constants.pageIntroduce:
              return BasePageRoute(settings: settings, builder: (context) => IntroducePage());
            case Constants.pageContact:
              return BasePageRoute(settings: settings, builder: (context) => ContactPage());
            case Constants.pageHistoryGift:
              return BasePageRoute(settings: settings, builder: (context) => HistoryGiftPage());
            case Constants.pageHistoryPoint:
              return BasePageRoute(settings: settings, builder: (context) => HistoryPointPage());
            case Constants.pageGiftList:
              return BasePageRoute(settings: settings, builder: (context) => GiftListPage());
            case Constants.pageGiftDetail:
              return BasePageRoute(settings: settings, builder: (context) => GiftDetailPage());
            case Constants.pageChallenge:
              return BasePageRoute(settings: settings, builder: (context) => ChallengePage());
            case Constants.pageScanCode:
              return BasePageRoute(settings: settings, builder: (context) => ScanCodePage2());
            case Constants.pageNotifications:
              return BasePageRoute(settings: settings, builder: (context) => NotificationPage());
            case Constants.pageNewsDetail:
              return BasePageRoute(settings: settings, builder: (context) => NewsDetailPage());
            case Constants.pageNotificationAdminDetail:
              return BasePageRoute(settings: settings, builder: (context) => NotificationSystemDetailPage());
            case Constants.pageSupportCatologue:
              return BasePageRoute(settings: settings, builder: (context) => CatologueDetailPage());
            // case Constants.pageCart:
            //   return BasePageRoute(settings: settings, builder: (context) => CartPage());
            // default:
            //   return BasePageRoute(settings: settings, builder: (context) => MasterPage());
          }
        },
      ),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Assets.images.backgroundSplash.image(width: double.infinity, height: double.infinity, fit: BoxFit.cover),
    );
  }
}
