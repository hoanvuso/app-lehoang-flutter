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
        showErrorToast(context: context, message: 'Không có tin tức này');
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
                return CommonTopbar(newObject?.name ?? 'Tin tức khuyến mãi');
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
          //   // data: '<div class=\"ck-content\"><p><i>Website Giải pháp lưu trữ Giám sát Seagate với những thông tin hữu ích giúp khách hàng tối</i><br><i>ưu thời gian tìm hiểu sản phẩm SkyHawk, các công nghệ lưu trữ giám sát cũng như các dịch</i><br><i>vụ dẫn đầu về bảo hành và cứu dữ liệu.</i></p><img onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoang.hoanvusolutions.com.vn/uploads/news_temp/bsryhuazlq-1626084456.jpeg\"> ><p><strong>Seagate</strong>, tập đoàn hàng đầu thế giới về các giải pháp quản lý và lưu trữ dữ liệu, vừa ra mắt<br>website chính thức cho dòng ổ cứng SkyHawk bằng tiếng Việt. Truy cập vào website, khách<br>hàng có thể tìm hiểu các thông tin về những giải pháp và sản phẩm lưu trữ cho ngành giám sát,<br>và tham khảo câu ch<mark class=\"marker-yellow\">uyện thành công cũng như các dịch </mark>vụ hỗ trợ gia tăng của Seagate. Thông<br>qua website này, khách hàng sẽ có được những trải nghiệm tốt hơn từ Seagate SkyHawk với sự<br>an tâm, nhanh chóng, thuận tiện và tối ưu chi phí.</p><ul><li>Sự an tâm: Khách hàng có thể truy cập các thông số kỹ thuật của sản phẩm cũng như các thông tin các đối tác chính thức của Seagate. Bên cạnh đó, những câu chuyện thành công của của khách hàng trên khắp thế giới cũng được chia sẻ để giúp khách hàng an tâm hơn trong việc sử dụng các giải pháp của Seagate.</li><li>Sự nhanh chóng: Các tin tức và chương trình khuyến mãi sẽ được cập nhật liên tục trên website để đảm bảo thông tin đến với khách hàng nhanh nhất có thể.</li><li>Sự thuận tiện: Thông qua website, khách hàng có thể dễ dàng lựa chọn loại camera giám sát phù hợp cho hệ thống cũng như liên hệ trực tiếp với các nhà phân phối chính hãng của ổ cứng Seagate SkyHawk trên toàn quốc. Khách hàng cũng có thể truy cập để liên hệ bảo hành hay đổi trả sản phẩm cũng như tìm kiếm các tài liệu về Dịch vụ cứu dữ liệu – một dịch vụ độc đáo mà Seagate đứng đầu.</li></ul><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">Tìm hiểu ngay sản phẩm SkyHawk của chúng tôi tại: https://nbg.seagate.com/vn-ocungskyhawk</span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">#SeagateSkyHawk #SkyHawkAI</span></p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=4\" type=\"text/css\">',
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
