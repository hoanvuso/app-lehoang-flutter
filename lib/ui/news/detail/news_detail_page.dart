import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/ui/news/detail/news_detail_viewmodel.dart';
import 'package:flutter_lehoang_extracare/utils/util/time_util.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatefulWidget {
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  // late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value != null) {
      final viewModel = context.read(newsDetailViewModel);
      if (value is NewObject) {
        viewModel.loadDetailNews(value.id);
      } else if (value is int) {
        viewModel.loadDetailNews(value);
      } else {
        showErrorToast(context: context, message: 'Kh??ng c?? tin t???c n??y');
      }
    }

    return Scaffold(
      body: BaseContainer(
        provider: newsDetailViewModel,
        child: Container(
          color: colorPrimary,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              HookBuilder(builder: (_) {
                final newObject = useProvider(newsDetailViewModel.select((value) => value.newObject));
                return CommonTopbar(newObject?.name ?? 'Tin t???c khuy???n m??i');
              }),
              Expanded(child: _buildMainView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return HookBuilder(builder: (_) {
      final newObject = useProvider(newsDetailViewModel.select((value) => value.newObject));
      return Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ShimmerLoadingImage(
                imageUrl: newObject?.image_url,
                width: double.infinity,
                height: (14/25).sw,
                fit: BoxFit.cover,
              )),
          Positioned(top: (13/25).sw, left: 0, right: 0, bottom: 0, child: _buildDescriptionView(newObject)),
        ],
      );
    });
  }

  Widget _buildDescriptionView(NewObject? newObject) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
          color: Colors.white),
      padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
      child: Column(
        children: [
          _buildTimeView(newObject),
          SizedBox(height: 10.h),
          Expanded(child: _buildInAppWebView(newObject))
          // Html(
          //   style: {
          //     "body": Style(
          //         fontSize: FontSize(15.sp),
          //         // fontWeight: FontWeight.bold
          //         color: Colors.black),
          //   },
          //   shrinkWrap: true,
          //   data: newObject?.body ?? '',
          //   // data: '<div class=\"ck-content\"><p><i>Website Gi???i ph??p l??u tr??? Gi??m s??t Seagate v???i nh???ng th??ng tin h???u ??ch gi??p kh??ch h??ng t???i</i><br><i>??u th???i gian t??m hi???u s???n ph???m SkyHawk, c??c c??ng ngh??? l??u tr??? gi??m s??t c??ng nh?? c??c d???ch</i><br><i>v??? d???n ?????u v??? b???o h??nh v?? c???u d??? li???u.</i></p><img onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoang.hoanvusolutions.com.vn/uploads/news_temp/bsryhuazlq-1626084456.jpeg\"> ><p><strong>Seagate</strong>, t???p ??o??n h??ng ?????u th??? gi???i v??? c??c gi???i ph??p qu???n l?? v?? l??u tr??? d??? li???u, v???a ra m???t<br>website ch??nh th???c cho d??ng ??? c???ng SkyHawk b???ng ti???ng Vi???t. Truy c???p v??o website, kh??ch<br>h??ng c?? th??? t??m hi???u c??c th??ng tin v??? nh???ng gi???i ph??p v?? s???n ph???m l??u tr??? cho ng??nh gi??m s??t,<br>v?? tham kh???o c??u ch<mark class=\"marker-yellow\">uy???n th??nh c??ng c??ng nh?? c??c d???ch </mark>v??? h??? tr??? gia t??ng c???a Seagate. Th??ng<br>qua website n??y, kh??ch h??ng s??? c?? ???????c nh???ng tr???i nghi???m t???t h??n t??? Seagate SkyHawk v???i s???<br>an t??m, nhanh ch??ng, thu???n ti???n v?? t???i ??u chi ph??.</p><ul><li>S??? an t??m: Kh??ch h??ng c?? th??? truy c???p c??c th??ng s??? k??? thu???t c???a s???n ph???m c??ng nh?? c??c th??ng tin c??c ?????i t??c ch??nh th???c c???a Seagate. B??n c???nh ????, nh???ng c??u chuy???n th??nh c??ng c???a c???a kh??ch h??ng tr??n kh???p th??? gi???i c??ng ???????c chia s??? ????? gi??p kh??ch h??ng an t??m h??n trong vi???c s??? d???ng c??c gi???i ph??p c???a Seagate.</li><li>S??? nhanh ch??ng: C??c tin t???c v?? ch????ng tr??nh khuy???n m??i s??? ???????c c???p nh???t li??n t???c tr??n website ????? ?????m b???o th??ng tin ?????n v???i kh??ch h??ng nhanh nh???t c?? th???.</li><li>S??? thu???n ti???n: Th??ng qua website, kh??ch h??ng c?? th??? d??? d??ng l???a ch???n lo???i camera gi??m s??t ph?? h???p cho h??? th???ng c??ng nh?? li??n h??? tr???c ti???p v???i c??c nh?? ph??n ph???i ch??nh h??ng c???a ??? c???ng Seagate SkyHawk tr??n to??n qu???c. Kh??ch h??ng c??ng c?? th??? truy c???p ????? li??n h??? b???o h??nh hay ?????i tr??? s???n ph???m c??ng nh?? t??m ki???m c??c t??i li???u v??? D???ch v??? c???u d??? li???u ??? m???t d???ch v??? ?????c ????o m?? Seagate ?????ng ?????u.</li></ul><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">T??m hi???u ngay s???n ph???m SkyHawk c???a ch??ng t??i t???i: https://nbg.seagate.com/vn-ocungskyhawk</span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">#SeagateSkyHawk #SkyHawkAI</span></p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=4\" type=\"text/css\">',
          // )
        ],
      ),
    );
  }

  Widget _buildTimeView(NewObject? newObject) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.icCalendar.image(width: 15.h, height: 15.h, color: colorGrey),
          SizedBox(width: 7.w),
          Text(formatServerDate(newObject?.created_at), style: styleTextGrey(14)),
        ],
      ),
    );
  }

  Widget _buildInAppWebView(NewObject? newObject) {
    if(newObject == null) return SizedBox();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
          color: Colors.white),
      padding: EdgeInsets.only(top: 20.h),
      child: InAppWebView(
        key: webViewKey,
        initialOptions: options,
        onWebViewCreated: (controller) {
          webViewController = controller;
          webViewController?.loadUrl(
              urlRequest: URLRequest(
                  url: Uri.dataFromString(
                  // '''
                  // <div class=\"ck-content\"> <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/fvxiqygrev-1634531655.jpg\"> > <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/sph6m2ymwn-1634531662.jpg\"> > <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/np3z3ke5ll-1634531662.jpg\"> > <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/linhevpjct-1634531673.jpg\"> > <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/nrzvpihore-1634531673.jpg\"> > <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/r5epcvbvv7-1634531673.jpg\"> > <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/ux8zgqnl55-1634531680.jpg\"> > <img onclick=\"javascript:window.location=this.src;\"  src=\"http://45.117.171.8/uploads/news_temp/60gwcgsi7k-1634531680.jpg\"> ></div><link rel=\"stylesheet\" href=\"http://45.117.171.8/plugins/custom/ckeditor/content-styles.css?v=4\" type=\"text/css\">
                  // '''
                    newObject.body ?? ""
                  ,
                      mimeType: 'text/html',
                      encoding: Encoding.getByName('utf-8'))));
        },
        onLoadStart: (controller, url) {
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          var uri = navigationAction.request.url!;

          if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
            if (await canLaunch(url)) {
              // Launch the App
              await launch(
                url,
              );
              // and cancel the request
              return NavigationActionPolicy.CANCEL;
            }
          }

          return NavigationActionPolicy.ALLOW;
        },
        // onLoadStop: (controller, url) async {
        //   pullToRefreshController.endRefreshing();
        //   setState(() {
        //     this.url = url.toString();
        //     urlController.text = this.url;
        //   });
        // },
        // onLoadError: (controller, url, code, message) {
        //   pullToRefreshController.endRefreshing();
        // },
        // onProgressChanged: (controller, progress) {
        //   final viewModel = context.read(introduceViewModel);
        //   if (progress == 100) {
        //     viewModel.isLoading = false;
        //   } else {
        //     viewModel.isLoading = true;
        //   }
        //   viewModel.notifyListeners();
        // },
        // onUpdateVisitedHistory: (controller, url, androidIsReload) {
        //   setState(() {
        //     this.url = url.toString();
        //     urlController.text = this.url;
        //   });
        // },
        // onConsoleMessage: (controller, consoleMessage) {
        //   print(consoleMessage);
        // },
      ),
    );
  }
}
