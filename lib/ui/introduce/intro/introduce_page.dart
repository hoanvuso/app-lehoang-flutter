import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_title_top_bar.dart';
import 'package:flutter_lehoang_extracare/ui/introduce/intro/introduce_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroducePage extends StatefulWidget {
  @override
  _IntroducePageState createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 150), () {
        final viewModel = context.read(introduceViewModel);
        viewModel.loadIntroduce();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        provider: introduceViewModel,
        child: Container(
          color: colorPrimary,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              _buildTopView(),
              Expanded(child: _buildMainView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopView() {
    return Container(
      height: 240.h,
      child: Stack(
        children: [
          Assets.images.backgroundHome.image(width: double.infinity, height: 240.h, fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 25.h, bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTitleTopbar('Giới thiệu', onBackPress: () {
                  Navigator.pop(context);
                }),
                SizedBox(height: 10.h),
                Align(
                    alignment: Alignment.center,
                    child: Assets.images.logoLehoang2.image(width: 200.w, height: 80.h, fit: BoxFit.fitWidth)),
                SizedBox(height: 10.h),
                Assets.images.imageProduct.image(width: double.infinity, height: 60.h, fit: BoxFit.cover),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildMainView() {
  //   return Container(
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
  //         color: Colors.white),
  //     padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
  //     child: HookBuilder(
  //       builder: (_) {
  //         final introduce = useProvider(introduceViewModel.select((value) => value.introduce));
  //         return SingleChildScrollView(
  //           child: Html(
  //             style: {
  //               "body": Style(
  //                   fontSize: FontSize(15.sp),
  //                   // fontWeight: FontWeight.bold,
  //                   color: Colors.black),
  //             },
  //             shrinkWrap: true,
  //             data: introduce?.body ?? '',
  //             // data: '<div class=\"ck-content\"><p><i>Website Giải pháp lưu trữ Giám sát Seagate với những thông tin hữu ích giúp khách hàng tối</i><br><i>ưu thời gian tìm hiểu sản phẩm SkyHawk, các công nghệ lưu trữ giám sát cũng như các dịch</i><br><i>vụ dẫn đầu về bảo hành và cứu dữ liệu.</i></p><img onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoang.hoanvusolutions.com.vn/uploads/news_temp/bsryhuazlq-1626084456.jpeg\"> ><p><strong>Seagate</strong>, tập đoàn hàng đầu thế giới về các giải pháp quản lý và lưu trữ dữ liệu, vừa ra mắt<br>website chính thức cho dòng ổ cứng SkyHawk bằng tiếng Việt. Truy cập vào website, khách<br>hàng có thể tìm hiểu các thông tin về những giải pháp và sản phẩm lưu trữ cho ngành giám sát,<br>và tham khảo câu ch<mark class=\"marker-yellow\">uyện thành công cũng như các dịch </mark>vụ hỗ trợ gia tăng của Seagate. Thông<br>qua website này, khách hàng sẽ có được những trải nghiệm tốt hơn từ Seagate SkyHawk với sự<br>an tâm, nhanh chóng, thuận tiện và tối ưu chi phí.</p><ul><li>Sự an tâm: Khách hàng có thể truy cập các thông số kỹ thuật của sản phẩm cũng như các thông tin các đối tác chính thức của Seagate. Bên cạnh đó, những câu chuyện thành công của của khách hàng trên khắp thế giới cũng được chia sẻ để giúp khách hàng an tâm hơn trong việc sử dụng các giải pháp của Seagate.</li><li>Sự nhanh chóng: Các tin tức và chương trình khuyến mãi sẽ được cập nhật liên tục trên website để đảm bảo thông tin đến với khách hàng nhanh nhất có thể.</li><li>Sự thuận tiện: Thông qua website, khách hàng có thể dễ dàng lựa chọn loại camera giám sát phù hợp cho hệ thống cũng như liên hệ trực tiếp với các nhà phân phối chính hãng của ổ cứng Seagate SkyHawk trên toàn quốc. Khách hàng cũng có thể truy cập để liên hệ bảo hành hay đổi trả sản phẩm cũng như tìm kiếm các tài liệu về Dịch vụ cứu dữ liệu – một dịch vụ độc đáo mà Seagate đứng đầu.</li></ul><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">Tìm hiểu ngay sản phẩm SkyHawk của chúng tôi tại: https://nbg.seagate.com/vn-ocungskyhawk</span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">#SeagateSkyHawk #SkyHawkAI</span></p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=4\" type=\"text/css\">',
  //             // data: '<div class=\"ck-content\"><p><i>Website Giải pháp lưu trữ Giám sát Seagate với những thông tin hữu ích giúp khách hàng tối</i><br><i>ưu thời gian tìm hiểu sản phẩm SkyHawk, các công nghệ lưu trữ giám sát cũng như các dịch</i><br><i>vụ dẫn đầu về bảo hành và cứu dữ liệu.</i></p><img onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoang.hoanvusolutions.com.vn/uploads/news_temp/bsryhuazlq-1626084456.jpeg\"><p><strong>Seagate</strong>, tập đoàn hàng đầu thế giới về các giải pháp quản lý và lưu trữ dữ liệu, vừa ra mắt<br>website chính thức cho dòng ổ cứng SkyHawk bằng tiếng Việt. Truy cập vào website, khách<br>hàng có thể tìm hiểu các thông tin về những giải pháp và sản phẩm lưu trữ cho ngành giám sát,<br>và tham khảo câu chuyện thành công cũng như các dịch vụ hỗ trợ gia tăng của Seagate. Thông<br>qua website này, khách hàng sẽ có được những trải nghiệm tốt hơn từ Seagate SkyHawk với sự<br>an tâm, nhanh chóng, thuận tiện và tối ưu chi phí.</p><ul><li>Sự an tâm: Khách hàng có thể truy cập các thông số kỹ thuật của sản phẩm cũng như các thông tin các đối tác chính thức của Seagate. Bên cạnh đó, những câu chuyện thành công của của khách hàng trên khắp thế giới cũng được chia sẻ để giúp khách hàng an tâm hơn trong việc sử dụng các giải pháp của Seagate.</li><li>Sự nhanh chóng: Các tin tức và chương trình khuyến mãi sẽ được cập nhật liên tục trên website để đảm bảo thông tin đến với khách hàng nhanh nhất có thể.</li><li>Sự thuận tiện: Thông qua website, khách hàng có thể dễ dàng lựa chọn loại camera giám sát phù hợp cho hệ thống cũng như liên hệ trực tiếp với các nhà phân phối chính hãng của ổ cứng Seagate SkyHawk trên toàn quốc. Khách hàng cũng có thể truy cập để liên hệ bảo hành hay đổi trả sản phẩm cũng như tìm kiếm các tài liệu về Dịch vụ cứu dữ liệu – một dịch vụ độc đáo mà Seagate đứng đầu.</li></ul><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">Tìm hiểu ngay sản phẩm SkyHawk của chúng tôi tại: https://nbg.seagate.com/vn-ocungskyhawk</span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">#SeagateSkyHawk #SkyHawkAI</span></p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">',
  //             // data: '<div class=\"ck-content\"><p><span style=\"background-color:rgb(255,255,255);color:hsl(0, 75%, 60%);\"><strong>CÔNG TY&nbsp;TNHH THƯƠNG MẠI KỸ THUẬT&nbsp;LÊ HOÀNG</strong></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><strong>Nhà nhập khẩu &amp; phân phối chính hãng cấp quốc gia</strong> camera giám sát </span><span style=\"background-color:rgb(255,255,255);color:hsl(0, 75%, 60%);\"><strong>HIKVISION</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(240, 75%, 60%);\"><strong>HDPARAGON</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(180, 75%, 60%);\"><strong>EZVIZ</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(30, 75%, 60%);\"><strong>ZKTECO</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> &amp; </span><span style=\"background-color:rgb(255,255,255);color:hsl(120, 75%, 60%);\"><strong>RUIJIE</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> tại <strong>VIỆT NAM</strong>. Với trụ sở chính tại TP.HCM, hơn 18 năm hoạt động, <strong>Công ty TNHH Thương Mại Kỹ Thuật LÊ HOÀNG</strong> hiện là nhà phân phối lớn hàng đầu với mạng lưới <strong>hàng trăm đại lý và đối tác</strong> rộng khắp cả nước.</span></p><figure class=\"image\"><img width=\"2000\" height=\"100\" src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/id7nqd9rmd-1626084734.jpeg\"></figure><p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,205);\"><strong>TRỤ SỞ CHÍNH CÔNG TY KỸ THUẬT LÊ HOÀNG</strong></span></p><figure class=\"image\"><img src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/03tr70mted-1626084801.jpeg\"></figure><p>&nbsp;</p><p>&nbsp;</p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">',
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildMainView() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
          color: Colors.white),
      padding: EdgeInsets.only(top: 20.h),
      child: HookBuilder(
        builder: (_) {
          final introduce = useProvider(introduceViewModel.select((value) => value.introduce));

          if (introduce == null) return SizedBox();
          return InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(url: Uri.parse("https://inappwebview.dev/")),
            initialOptions: options,
            onWebViewCreated: (controller) {
              webViewController = controller;
              webViewController?.loadUrl(
                  urlRequest: URLRequest(
                      url: Uri.dataFromString(introduce.body ?? '',
                          // """
                          // <!DOCTYPE html>\n<html lang=\"vn\">\n    <head>\n        <meta charset=\"utf-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n\n        <title>Api</title>\n\n        <!-- Fonts -->\n        <link href=\"https://fonts.googleapis.com/css?family=Nunito:200,600\" rel=\"stylesheet\">\n\n        <!-- Styles -->\n        <style>\n            figure,img{\n            \"width:100%;\n            },\n        </style>\n    </head>\n    <body>\n       <div class=\"ck-content\"><p style=\"text-align:justify;\"><span style=\"background-color:rgb(255,255,255);color:hsl(0,75%,60%);\"><strong>CÔNG TY&nbsp;TNHH THƯƠNG MẠI KỸ THUẬT&nbsp;LÊ HOÀNG</strong></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><strong>Nhà nhập khẩu &amp; phân phối chính hãng cấp quốc gia</strong> camera giám sát &nbsp;</span><span style=\"background-color:rgb(255,255,255);color:hsl(0,75%,60%);\"><strong>HIKVISION</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(240,75%,60%);\"><strong>HDPARAGON</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(270,75%,60%);\"><strong>EZVIZ</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(30,75%,60%);\"><strong>ZKTECO</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> &nbsp;&amp; </span><span style=\"background-color:rgb(255,255,255);color:hsl(0,75%,60%);\"><strong>RUIJIE</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> &nbsp;tại <strong>VIỆT NAM</strong>. Với trụ sở chính tại TP.HCM, hơn 18 năm hoạt động, <strong>Công ty TNHH Thương Mại Kỹ Thuật LÊ HOÀNG</strong> hiện là nhà phân phối lớn hàng đầu với mạng lưới <strong>hàng trăm đại lý và đối tác</strong> rộng khắp cả nước.</span></p><figure class=\"image image_resized image-style-align-center\" style=\"width:100%;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/id7nqd9rmd-1626084734.jpeg\"></figure><p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,205);\"><strong>TRỤ SỞ CHÍNH CÔNG TY KỸ THUẬT LÊ HOÀNG</strong></span></p><figure class=\"image\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/03tr70mted-1626084801.jpeg\"></figure><p><span style=\"color:rgb(0,0,205);\"><strong>VĂN PHÒNG CHI NHÁNH CTY LÊ HOÀNG</strong></span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/LHKho1.jpg\" alt=\"\"></figure><p style=\"text-align:justify;\">Với kinh nghiệm dày dặn trong gần 20 năm hoạt động, <span style=\"color:rgb(128,0,128);\"><strong>Công ty TNHH Thương Mại Kỹ Thuật Lê Hoàng</strong></span> đã đánh dấu rất nhiều cột mốc sự kiện lớn trong quá trình trưởng thành và giờ đây trở thành&nbsp;nhà thống lĩnh thị trường Việt Nam trong lĩnh vực nhập khẩu và&nbsp;phân phối các sản phẩm Camera, thiết bị mạng, thiết bị an ninh,...,&nbsp;của những thương hiệu hàng đầu trên thế giới&nbsp;<span style=\"color:rgb(255,0,0);\"><strong>HIKVISION</strong></span><strong>,&nbsp;</strong><span style=\"color:rgb(0,0,255);\"><strong>HDPARAGON,&nbsp;</strong></span><span style=\"color:rgb(0,153,255);\"><strong>EZVIZ,&nbsp;</strong></span><span style=\"color:rgb(0,100,0);\"><strong>ZKTECO</strong></span><span style=\"color:rgb(0,153,255);\"><strong>&nbsp;&amp;&nbsp;</strong></span><span style=\"color:rgb(178,34,34);\"><strong>RUIJIE.</strong></span></p><p style=\"text-align:justify;\"><strong>Công ty TNHH Thương Mại Kỹ Thuật Lê Hoàng</strong> tự hào là nhà đại diện của Việt Nam tham dự Hội nghị khách hàng toàn cầu 2019 của <span style=\"color:rgb(0,128,0);\"><strong>ZKTeco</strong></span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/73116981_10220546075189888_8262971852880609280_n.jpg\" alt=\"ZKTeco - Gala Dinner Toàn cầu 2019 - Lê Hoàng CCTV\"></figure><p style=\"text-align:justify;\"><strong>Công ty Lê Hoàng&nbsp;</strong>tổ chức cho anh em đại lý 3 miền&nbsp;<span style=\"color:rgb(28,30,33);\">đi giao lưu, khám phá đất nước Nhật Bản. Chuyến đi đầy bổ ích và đã thành công tốt đẹp.</span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/72786968_776498062772162_7106066744631885824_o%282%29.jpg\" alt=\"Chuyến du lịch cùng đại lý Hikvision- Lehoangcctv\"></figure><p style=\"text-align:justify;\"><br>&nbsp;</p><figure class=\"image image_resized\" style=\"width:2048px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/HINH%20DULICH/nhat\" alt=\"\"></figure><p style=\"text-align:justify;\"><strong>Công ty Thương Mại Kỹ Thuật Lê Hoàng</strong> cùng quý&nbsp;đối tác tận hưởng kỳ nghỉ dưỡng tuyệt vời&nbsp;<span style=\"color:rgb(28,30,33);\">tại thiên đường biển đảo Bali - Indonesia.</span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/70849096_749723695449599_6655662006860775424_o.jpg\" alt=\"Tri ân các đại lý Hikvision - Lê Hoàng CCTV\"></figure><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/69660386_747095482379087_4325407752156348416_o.jpg\" alt=\"Các đai lý HikVision Việt Nam nghỉ dường cùng công ty Lê Hoàng CCTV\"></figure><p style=\"text-align:justify;\"><strong>Công ty TNHH Thương Mại Kỹ Thuật Lê Hoàng</strong> vinh hạnh&nbsp;<span style=\"color:rgb(28,30,33);\">đón tiếp đoàn lãnh đạo cao cấp của </span><span style=\"color:rgb(255,0,0);\"><strong>Hikvision</strong></span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/68751597_732011903887445_4447222830081245184_o.jpg\" alt=\"Đoàn lãnh đạo hikvision - lehoang\"></figure><p style=\"text-align:justify;\">...và cùng đại lý thăm VP Hikvision tại Việt Nam.</p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/37759071_505874466501191_3516261039148630016_o%281%29.jpg\" alt=\"Văn Phòng chính hãng Hikvision - Lê Hoàng CCTV\"></figure><p><span style=\"color:rgb(255,0,0);\"><strong>Công ty kỹ thuật Lê Hoàng phối hợp với hãng EZVIZ tổ chức Hội thảo giới thiệu sản phẩm mới tại TP.HCM (9/2018)</strong></span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/EZVIZHCM1.jpg\" alt=\"\"></figure><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoangcctv.com/ckeditor/kcfinder/upload/images/EZVIZHCM2.jpg\" alt=\"\"></figure><p><span style=\"color:rgb(255,0,0);\"><strong>Công ty kỹ thuật Lê Hoàng phối hợp với hãng Hikvision tổ chức Hội thảo giới thiệu sản phẩm mới tại Nha Trang (6/2018)</strong></span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/lvansonntrang.jpg\" alt=\"\"></figure><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/andrew-2ok.jpg\" alt=\"\"></figure><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/andrew-3ok.jpg\" alt=\"\"></figure><hr><p><strong>Công ty kỹ thuật Lê Hoàng tham gia triễn&nbsp;lãm quốc tế thiết bị an ninh Secutech 8-2017 tại TP. HCM:</strong></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://www.hikvisionvietnam.vn/uploads/gioithieu/ok-gian-hang-_MG_2903.jpg\" alt=\"\"></figure><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><strong>Lãnh đạo công ty Lê Hoàng cùng các đại lý thân thiết tham quan Trụ sở chính &amp; Nhà máy Hikvision 5-2017:</strong></span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://www.hikvisionvietnam.vn/uploads/gioithieu/thamquan-3ok1.png\" alt=\"\"></figure><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://www.hikvisionvietnam.vn/uploads/gioithieu/thamquan-2ok1.png\" alt=\"\"></figure><p><strong>Một số hình ảnh hội thảo giới thiệu sản phẩm và tri ân khách hàng&nbsp;tại&nbsp;TP.HCM&nbsp;12-2016:</strong></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/nang-le-chuc-mung.jpg\" alt=\"\"></figure><p>Ông Lê Văn Sơn - Giám đốc Cty Lê Hoàng phát biểu về tình hình hoạt động kinh doanh 2016 và kế hoạch năm 2017</p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/harry-phat-bieu.jpg\" alt=\"\"></figure><p>Ông Harry Sia phát biểu về thành tựu hãng Hikvision đạt được trong năm 2016 và một số công nghệ sản phẩm mới<br><span style=\"color:rgb(0,0,255);\"><strong>Video clips Gala Dinner Hikvision 2016</strong></span></p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/trao-qua-1.jpg\" alt=\"\"></figure><p>Đại diện Cty Lê Hoàng -&nbsp;Hikvision Việt Nam&nbsp;trao quà&nbsp;cho các đại lý thân thiết (1)</p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/traoqua-2.jpg\" alt=\"\"></figure><p>Đại diện Cty Lê Hoàng -&nbsp;Hikvision Việt Nam trao quà cho các Master Dealer và đại lý đạt doanh số cao (1)</p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/traoqua-5.jpg\" alt=\"\"></figure><p>Đại diện Cty Lê Hoàng -&nbsp;Hikvision Việt Nam trao quà cho các Master Dealer và đại lý đạt doanh số cao (2)</p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/traoqua-6.jpg\" alt=\"\"></figure><p>Ông Harry Sia và Bà&nbsp;Stella - đại diện&nbsp;hãng Hikvision trao quà cho các Master Dealer các tỉnh/thành phố&nbsp;trong cả nước</p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/traoqua-7.jpg\" alt=\"\"></figure><p>Đại diện Cty Lê Hoàng -&nbsp;Hikvision Việt Nam trao quà cho các Master Dealer đạt doanh số lớn&nbsp;trong năm 2016</p><figure class=\"image image_resized\" style=\"width:1600px;\"><img style=\"width:100%\"  onclick=\"javascript:window.location=this.src;\"  src=\"http://hikvisionvietnam.vn/uploads/gioithieu/xe-2-ok.jpg\" alt=\"\"></figure></div><link rel=\"stylesheet\" href=\"http://45.117.171.8/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">}\n    </body>\n</html>\n
                          // """,
                          //                       """<!DOCTYPE html>
                          // <html>
                          //   <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
                          //   <body style='"margin: 0; padding: 0;'>
                          //     <div class=\"ck-content\"><p><span style=\"background-color:rgb(255,255,255);color:hsl(0, 75%, 60%);\"><strong>CÔNG TY&nbsp;TNHH THƯƠNG MẠI KỸ THUẬT&nbsp;LÊ HOÀNG</strong></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><strong>Nhà nhập khẩu &amp; phân phối chính hãng cấp quốc gia</strong> camera giám sát </span><span style=\"background-color:rgb(255,255,255);color:hsl(0, 75%, 60%);\"><strong>HIKVISION</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(240, 75%, 60%);\"><strong>HDPARAGON</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(180, 75%, 60%);\"><strong>EZVIZ</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(30, 75%, 60%);\"><strong>ZKTECO</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> &amp; </span><span style=\"background-color:rgb(255,255,255);color:hsl(120, 75%, 60%);\"><strong>RUIJIE</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> tại <strong>VIỆT NAM</strong>. Với trụ sở chính tại TP.HCM, hơn 18 năm hoạt động, <strong>Công ty TNHH Thương Mại Kỹ Thuật LÊ HOÀNG</strong> hiện là nhà phân phối lớn hàng đầu với mạng lưới <strong>hàng trăm đại lý và đối tác</strong> rộng khắp cả nước.</span></p><figure class=\"image\"><img src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/id7nqd9rmd-1626084734.jpeg\"></figure><p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,205);\"><strong>TRỤ SỞ CHÍNH CÔNG TY KỸ THUẬT LÊ HOÀNG</strong></span></p><figure class=\"image\"><img src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/03tr70mted-1626084801.jpeg\"></figure><p>&nbsp;</p><p>&nbsp;</p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">
                          //   </body>
                          // </html>""",

                          // '<div class=\"ck-content\"><p><span style=\"background-color:rgb(255,255,255);color:hsl(0, 75%, 60%);\"><strong>CÔNG TY&nbsp;TNHH THƯƠNG MẠI KỸ THUẬT&nbsp;LÊ HOÀNG</strong></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><strong>Nhà nhập khẩu &amp; phân phối chính hãng cấp quốc gia</strong> camera giám sát </span><span style=\"background-color:rgb(255,255,255);color:hsl(0, 75%, 60%);\"><strong>HIKVISION</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(240, 75%, 60%);\"><strong>HDPARAGON</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(180, 75%, 60%);\"><strong>EZVIZ</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">, </span><span style=\"background-color:rgb(255,255,255);color:hsl(30, 75%, 60%);\"><strong>ZKTECO</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> &amp; </span><span style=\"background-color:rgb(255,255,255);color:hsl(120, 75%, 60%);\"><strong>RUIJIE</strong></span><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"> tại <strong>VIỆT NAM</strong>. Với trụ sở chính tại TP.HCM, hơn 18 năm hoạt động, <strong>Công ty TNHH Thương Mại Kỹ Thuật LÊ HOÀNG</strong> hiện là nhà phân phối lớn hàng đầu với mạng lưới <strong>hàng trăm đại lý và đối tác</strong> rộng khắp cả nước.</span></p><figure class=\"image\"><img src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/id7nqd9rmd-1626084734.jpeg\"></figure><p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,205);\"><strong>TRỤ SỞ CHÍNH CÔNG TY KỸ THUẬT LÊ HOÀNG</strong></span></p><figure class=\"image\"><img src=\"http://lehoang.hoanvusolutions.com.vn/uploads/page/03tr70mted-1626084801.jpeg\"></figure><p>&nbsp;</p><p>&nbsp;</p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">',
                          //   '''<div class=\"ck-content\"><p><strong>Hiệu quả kiểm soát vi khuẩn </strong><i><strong>Vibrio</strong></i><strong> của 03 chế phẩm từ tự nhiên</strong></p><figure class=\"image\"><img onclick=\"javascript:window.location=this.src;\"  src=\"http://app.vinhthinhbiostadt.com.vn:9000/uploads/news_temp/ptymqr8agd-1611378646.jpg\"></figure><p><i>Hình - Trại sản xuất tôm giống thường áp dụng các phương pháp phân tích trong phòng thí nghiệm để kiểm soát mầm bệnh và gia tăng lợi nhuận (Nguồn: Darryl Jory)</i></p><p><span style=\"font-family:Arial, Helvetica, sans-serif;\">Hiện nay, các trại sản xuất tôm giống ở châu Mỹ và châu Á đang phải đối mặt với sự gia tăng ngày càng cao của bệnh truyền nhiễm. Đáng chú ý nhất là bệnh liên quan đến vi khuẩn <i>Vibrio spp</i>. (như <i>Vibrio harveyi</i>, <i>Vibrio alginolyticus</i> và <i>Vibrio campbellii</i>). Điển hình là trại giống ở Ecuador thường mắc một số bệnh do vi khuẩn Vibrio gây ra như hội chứng Bolitas nigricans (do vi khuẩn <i>V. harveyi</i>) và hội chứng Zoea 2 (do vi khuẩn <i>V. harveyi </i>và <i>V. alginolyticus)</i>. Do đó, việc xác định hiệu quả của chế phẩm từ tự nhiên sẽ có ảnh hưởng lớn đến việc kiểm soát bệnh trong nuôi trồng thủy sản.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kháng sinh:</strong> được sử dụng rộng rãi và là thuốc dự phòng khi có dịch bệnh xảy ra. Tuy nhiên, sử dụng kháng sinh thường dẫn đến dư lượng trong vật nuôi thủy sản, ảnh hưởng xấu đến phát triển và nhân giống, đặc biệt là tính đối kháng mầm bệnh, bao gồm cả bệnh trên người. Vì vậy, chính quyền các nước đã có quy định kiểm soát chặt chẽ khi sử dụng kháng sinh. Chiến lược sử dụng các chế phẩm tự nhiên để thay thế kháng sinh, kiểm soát mầm bệnh trong trại giống là cần thiết trong nuôi trồng thủy sản.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Chế phẩm sinh học:</strong> Hiệu quả của chế phẩm sinh học được thể hiện qua khả năng ức chế vi khuẩn của chúng trong đường ruột, đối kháng chọn lọc chống lại mầm bệnh, cải thiện hệ thống miễn dịch, gia tăng tỷ lệ sống và tăng trưởng của tôm, kiểm soát chất thải và duy trì chất lượng nước.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Acid hữu cơ: </strong>được sử dụng làm chất bảo quản và kiểm soát vi khuẩn trong thực phẩm, nông nghiệp.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Tinh dầu: </strong>đã được chứng minh là có đặc tính kháng khuẩn, chống oxy hóa và kháng nấm,&nbsp; thay thế cho việc sử dụng phụ gia trong sản xuất tôm giống.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Mặc dù việc sử dụng các sản phẩm tự nhiên như acid hữu cơ và tinh dầu trong trại giống ở Ecuador tương đối mới, nhưng nhu cầu ứng dụng của chúng ngày càng tăng. Để xác định chế phẩm nào có hiệu quả, trại sản xuất giống sẽ tiến hành các thử nghiệm bên trong cơ sở của họ.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Đầu tiên, trại sản xuất giống tôm ở Ecuador thực hiện một cuộc khảo sát để thu thập các chủng vi khuẩn gây bệnh hiện nay tại địa phương. Qua đó, độc lực của chúng được xác định thông qua quá trình cảm nhiễm, đồng thời phân lập để xác định mối tương quan với vi khuẩn Vibrio gây bệnh. Sau đó, trại sản xuất giống đã tiến hành 1 số thử nghiệm tại cơ sở để đánh giá hiệu quả kháng khuẩn của kháng sinh, men vi sinh, acid hữu cơ và tinh dầu.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Nội dung thử nghiệm</strong></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Thu 31 mẫu ấu trùng tôm thẻ chân trắng hoạt động bơi lội kém, trống ruột và chậm phát triển, <i>Litopenaeus vannamei</i> [từ Nauplii 5 (N5) đến postlarvae 13 (PL13)] từ các bể của 10 trại sản xuất giống tôm ở Santa Elena, Ecuador. Chúng được gửi đến Trung tâm Nghiên cứu Thủy sản và Nuôi trồng Thủy sản Quốc gia (Trung tâm nghiên cứu về sinh vật biển CENAIM, Santa Elena, Ecuador) để xác định hàm lượng vi khuẩn.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Các chủng vi khuẩn được phân lập, lưu trữ và cảm nhiễm gây bệnh trên tôm. Các chủng này được xác định bằng phương pháp PCR, phân tích trình tự 16S rRNA.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Sau cảm nhiễm, sử dụng 16 chế phẩm tự nhiên (5 loại chế phẩm sinh học, 9 loại acid hữu cơ, 2 loại tinh dầu) và 11 loại kháng sinh để xử lý và đánh giá hiệu quả.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kết quả và thảo luận</strong></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kháng sinh</strong> có hiệu quả trị liệu cao nhất, có khả năng ức chế sự phát triển của vi khuẩn gây bệnh, nhưng các các loại kháng sinh này không được phép sử dụng trong nuôi trồng thủy sản. Nghiên cứu này còn cho thấy chỉ số kháng kháng sinh (MAR) trung bình là 0,23.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Chỉ số kháng kháng sinh cao được tìm thấy trong tất cả trại sản xuất giống trên toàn thế giới, và đặc biệt cao rất nhiều trong các trang trại nuôi tôm thương phẩm. Ví dụ, chỉ số MAR dao động từ 0,21 - 0,38 đã được ghi nhận đối với vi khuẩn phân lập từ trại sản xuất tôm giống, nhưng chỉ số MAR trong trại nuôi tôm thương phẩm chỉ nằm trong khoảng từ 0,11 - 0,32.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Chỉ số MAR trung bình được xác định trong nghiên cứu này là thấp so với các giá trị được báo cáo trong các trại sản xuất giống tôm khác. Tuy nhiên, tất cả chủng vi khuẩn đều kháng cùng lúc với penicillin và oxytetracycline, cả hai loại kháng sinh được sử dụng trong y học. Nguyên nhân là do hầu hết mẫu thu từ các trại sản xuất giống nằm trong khu vực có nhiều hoạt động nhân tạo, không được xử lý nước thải, đây có thể là nguồn gây ô nhiễm kháng sinh.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Trong nghiên cứu này, chỉ có một loại <strong>chế phẩm sinh học</strong> thể hiện khả năng kháng khuẩn cao (85% chủng vi khuẩn). Các chế phẩm sinh học còn lại chỉ ức chế 15 - 30% chủng vi khuẩn. Tuy nhiên, trong đó có 2 chủng vi khuẩn không bị ức chế hoàn toàn bởi bất cứ loại chế phẩm sinh học nào.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Chỉ có một loại <strong>acid hữu cơ</strong> kiểm soát sự tăng trưởng của hầu hết các chủng vi khuẩn ở nồng độ thấp. Đó là hỗn hợp acid hữu cơ của acid axetic, acid propionic và acid formic. Các acid này, có hiệu quả trong việc kiểm soát <i>Vibrio</i> gây bệnh cho tôm và các sinh vật thủy sinh. Hỗn hợp acid hữu cơ hiệu quả thứ hai là acid lactic, fumaric, citric, malic và succinic. Ngoài ra, acid formic được xem là chất đặc biệt hiệu quả chống lại <i>Vibrio</i> gây bệnh và acid acetic có tác dụng mạnh mẽ với <i>V. parahaemolyticus.</i></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Tinh dầu</strong> oregano ức chế hiệu quả sự tăng trưởng của tất cả các chủng vi khuẩn trong nghiên cứu với giá trị MIC ≤ 3 mg/l. Các loại tinh dầu làm gián đoạn quá trình giao tiếp của vi khuẩn, giảm độc lực và khả năng gây bệnh của vi khuẩn. Hiệu quả ức chế vi khuẩn liên quan đến sự hiện diện của thymol và carvacrol, làm giảm số lượng vi khuẩn của <i>V. Vulnificus, V. parahaemolyticus </i>và<i> V. cholera</i> trong gan tôm thẻ chân trắng P. vannamei.</span><br><br><br><br><strong>Người dịch:</strong>&nbsp;<strong>Thạc sĩ&nbsp;Lê Hải Quỳnh - Công ty Vinhthinh Biostadt</strong><br><br><strong>Nguồn:</strong>&nbsp;https://www.aquaculturealliance.org/advocate/efficacy-natural-products-antibiotics-shrimp-hatcheries/<br>&nbsp;</p></div><link rel=\"stylesheet\" href=\"http://app.vinhthinhbiostadt.com.vn:9000/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">''',
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
            onProgressChanged: (controller, progress) {
              final viewModel = context.read(introduceViewModel);
              if (progress == 100) {
                viewModel.isLoading = false;
              } else {
                viewModel.isLoading = true;
              }
              viewModel.notifyListeners();
            },
            // onUpdateVisitedHistory: (controller, url, androidIsReload) {
            //   setState(() {
            //     this.url = url.toString();
            //     urlController.text = this.url;
            //   });
            // },
            // onConsoleMessage: (controller, consoleMessage) {
            //   print(consoleMessage);
            // },
          );
        },
      ),
    );
  }
}
