import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_page_route.dart';
import 'package:flutter_lehoang_extracare/ui/home/home_page.dart';
import 'package:flutter_lehoang_extracare/ui/news/detail/news_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/news/promotion/promotion_page.dart';
import 'package:flutter_lehoang_extracare/ui/news/tech/tech_page.dart';
import 'package:flutter_lehoang_extracare/ui/notification/detailsystem/notification_system_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/product/category/product_category_page.dart';
import 'package:flutter_lehoang_extracare/ui/product/categorychild/product_category_child_page.dart';
import 'package:flutter_lehoang_extracare/ui/product/company/product_company_page.dart';
import 'package:flutter_lehoang_extracare/ui/product/compare/product_compare_page.dart';
import 'package:flutter_lehoang_extracare/ui/product/detail/product_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/product/list/product_list_page.dart';
import 'package:flutter_lehoang_extracare/ui/support/catologue/catologue_detail.dart';
import 'package:flutter_lehoang_extracare/ui/support/document/detail/support_document_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/support/document/detail/support_document_detail_page2.dart';
import 'package:flutter_lehoang_extracare/ui/support/document/support_document_page.dart';
import 'package:flutter_lehoang_extracare/ui/support/question/support_question_page.dart';
import 'package:flutter_lehoang_extracare/ui/support/solution/detail/support_solution_detail_page.dart';
import 'package:flutter_lehoang_extracare/ui/support/solution/support_solution_page.dart';
import 'package:flutter_lehoang_extracare/ui/support/support_page.dart';
import 'package:flutter_lehoang_extracare/utils/util/alert_util.dart';
import 'package:flutter_lehoang_extracare/utils/util/notification_fcm_util.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import 'component/bottom_bar_button.dart';
import 'master_page_view_model.dart';

class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> with TickerProviderStateMixin {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  // static final _navigatorKey = GlobalKey<NavigatorState>();
  HeroController? _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(createRectTween: (begin, end) => MaterialRectArcTween(begin: begin, end: end));

    setupFCM();
    // if (Platform.isAndroid) {
    //   setupFCM();
    // } else {
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorBackgroundDefault,
        body: Navigator(
          observers: [_heroController!],
          key: _navigatorKey,
          initialRoute: Constants.pageHome,
          onGenerateRoute: (settings) {
            context.read(masterPageViewModel).addPageToBackStack(settings.name, false);
            switch (settings.name) {
              case Constants.pageHome:
                return BasePageRoute(settings: settings, builder: (context) => HomePage());
              case Constants.pageProductCompany:
                return BasePageRoute(settings: settings, builder: (context) => ProductCompanyPage());
              case Constants.pageProductCategory:
                return BasePageRoute(settings: settings, builder: (context) => ProductCategoryPage());
              case Constants.pageProductCategoryChild:
                return BasePageRoute(settings: settings, builder: (context) => ProductCategoryChildPage());
              case Constants.pageProductList:
                return BasePageRoute(settings: settings, builder: (context) => ProductListPage());
              case Constants.pageProductDetail:
                return BasePageRoute(settings: settings, builder: (context) => ProductDetailPage());
              case Constants.pageProductCompare:
                return BasePageRoute(settings: settings, builder: (context) => ProductComparePage());
              // case Constants.pageNews:
              //   return BasePageRoute(settings: settings, builder: (context) => NewsPage());
              case Constants.pagePromotion:
                return BasePageRoute(settings: settings, builder: (context) => PromotionPage());
              case Constants.pageTech:
                return BasePageRoute(settings: settings, builder: (context) => TechPage());
              case Constants.pageNewsDetail:
                return BasePageRoute(settings: settings, builder: (context) => NewsDetailPage());
              case Constants.pageNotificationAdminDetail:
                return BasePageRoute(settings: settings, builder: (context) => NotificationSystemDetailPage());
              case Constants.pageSupport:
                return BasePageRoute(settings: settings, builder: (context) => SupportPage());
              case Constants.pageSupportSolution:
                return BasePageRoute(settings: settings, builder: (context) => SupportSolutionPage());
              case Constants.pageSupportSolutionDetail:
                return BasePageRoute(settings: settings, builder: (context) => SupportSolutionDetailPage());
              case Constants.pageSupportDocument:
                return BasePageRoute(settings: settings, builder: (context) => SupportDocumentPage());
              case Constants.pageSupportDocumentDetail:
                return BasePageRoute(settings: settings, builder: (context) => SupportDocumentDetailPage());
              case Constants.pageSupportQuestion:
                return BasePageRoute(settings: settings, builder: (context) => SupportQuestionPage());
              case Constants.pageSupportCatologue:
                return BasePageRoute(settings: settings, builder: (context) => CatologueDetailPage());
              default:
                return BasePageRoute(settings: settings, builder: (context) => HomePage());
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: _buildFloatButton(),
        bottomNavigationBar: _buildBottomAppBar(),
      ),
      onWillPop: _onWillPop,
    );
  }

  Widget _buildBottomAppBar() {
    final viewModel = context.read(masterPageViewModel);
    return PreferredSize(
      preferredSize: Size.fromHeight(100.h),
      child: BottomAppBar(
        notchMargin: 5.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: BottomBarButton(
                text: 'Trang chủ',
                iconData: Assets.images.icMenuHome,
                iconWidth: 22.h,
                iconHeight: 25.h,
                tab: MasterPageTab.tabHome,
                onPress: () {
                  _navigatorKey.currentState?.pushNamedAndRemoveUntil(Constants.pageHome, (_) => false);
                  // _navigatorKey.currentState?.pushNamed(Constants.pageHome);
                  viewModel.addPageToBackStack(Constants.pageHome);
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: BottomBarButton(
                text: 'Sản phẩm',
                iconData: Assets.images.icMenuProduct,
                tab: MasterPageTab.tabProduct,
                onPress: () {
                  _navigatorKey.currentState
                      ?.pushNamedAndRemoveUntil(Constants.pageProductCompany, (route) => route.isFirst);
                  viewModel.addPageToBackStack(Constants.pageProductCompany);
                },
              ),
            ),
            Expanded(
                flex: 2,
                child: BottomBarButton(
                  text: 'Quét mã',
                  iconWidth: 30.h,
                )),
            Expanded(
              flex: 2,
              child: BottomBarButton(
                text: 'Khuyến mãi',
                iconWidth: 30.h,
                iconData: Assets.images.icMenuPromotion,
                tab: MasterPageTab.tabPromotion,
                onPress: () {
                  _navigatorKey.currentState
                      ?.pushNamedAndRemoveUntil(Constants.pagePromotion, (route) => route.isFirst);
                  // _navigatorKey.currentState?.pushNamed(Constants.pageNews);
                  viewModel.addPageToBackStack(Constants.pagePromotion);
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: BottomBarButton(
                text: 'Hỗ trợ',
                iconWidth: 20.h,
                iconData: Assets.images.icMenuSupport,
                tab: MasterPageTab.tabSupport,
                onPress: () {
                  _navigatorKey.currentState?.pushNamedAndRemoveUntil(Constants.pageSupport, (route) => route.isFirst);
                  // _navigatorKey.currentState?.pushNamed(Constants.pageSupport);
                  viewModel.addPageToBackStack(Constants.pageSupport);
                  // viewModel.setCurrentTab(MasterPageTab.tabSupport);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkNotLogin() {
    final isLogged = context.read(prefsProvider).getUser() != null;
    if (!isLogged) {
      showToast(context: context, message: "Bạn phải đăng nhập để sử dụng tính năng này");
      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageLogin, (route) => false);
      return true;
    }
    return false;
  }

  Widget _buildFloatButton() {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          if (checkNotLogin()) return;
          // context.read(masterPageViewModel).addPageToBackStack(Constants.pageScanCode);
          Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageScanCode);
        },
        child: Container(
          padding: EdgeInsets.all(5.h),
          decoration: decorOnlyBorder(color: colorPrimary, radius: 2.r, width: 1.5),
          height: 50.h,
          width: 50.h,
          child: Assets.images.icMenuScanCode.image(width: 20.h, height: 20.h, color: colorPrimary),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_navigatorKey.currentState?.canPop() == true) {
      _navigatorKey.currentState?.pop();
      context.read(masterPageViewModel).backPageFromBackStack();
      // context.read(customBottomNavViewModel).setAnimate(true);

      return false;
    }

    Completer<bool> completer = Completer();
    showAlertConfirm(
      context: context,
      message: 'Bạn muốn quay lại màn hình đăng nhập?',
      title: 'Đăng xuất?',
      onPressOk: () {
        context.read(prefsProvider).clearData();
        completer.complete(true);
        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageLogin, (route) => false);
      },
      onPressCancel: () {
        completer.complete(false);
      },
    );
    return completer.future;
  }

  void setupFCM() async {
    // Khi app đang foreground
    setupFCMForeground(context, openNotificationPayload);

    // Khi vừa mới mở app từ background
    final fcmMessaging = FirebaseMessaging.instance;
    final message = await fcmMessaging.getInitialMessage();
    final lastFcmMessageId = context.read(prefsProvider).getFCMMessageId();

    if (message != null && message.messageId != lastFcmMessageId) {
      context.read(prefsProvider).saveFCMMessageId(message.messageId);
      openNotificationPayload(json.encode(message.data));
    }
  }

  Future openNotificationPayload(String? payload) async {
    if (payload == null) return;

    final map = json.decode(payload);
    final notification_id = map["notification_id"] ?? "";
    final id = map["id"] ?? "-1";
    final body = map["body"] ?? "";
    final type = map["type"] ?? "";
    final resource_table_name = map["resource_table_name"] ?? "";
    final badge = map["badge"] ?? "";
    final title = map["title"] ?? "";
    final click_action = map["click_action"] ?? "";
    final status = map["status"] ?? "";

    // showToast(context: context, message: 'title: $title');
    try {
      if (type == "SYS_NOTIFICATION") {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(Constants.pageNotificationAdminDetail, arguments: int.parse(id));
      } else {
        Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageNewsDetail, arguments: int.parse(id));
      }

      // notificationSplashPayload = NotificationSplashPayload(
      //   type: type,
      //   notificationId: int.parse(notification_id),
      //   resourceId: int.parse(id),
      //   status: status,
      // );
    } catch (e) {}
    // await _navigatorKey.currentState.pushNamed(Constants.pageNotificationSplash, arguments: notificationSplashPayload);
  }
}
