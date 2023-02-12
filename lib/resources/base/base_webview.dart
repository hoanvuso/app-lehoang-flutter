import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin BaseWebView<T extends StatefulWidget> on State<T> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true, mediaPlaybackRequiresUserGesture: false, minimumFontSize: 15),
      android: AndroidInAppWebViewOptions(useHybridComposition: true, defaultFontSize: 15),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    // ...
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  String getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes), mimeType: mime).toString();
  }

  Future<String> addFontToHtml(String htmlContent, String fontAssetPath, String fontMime) async {
    final fontData = await rootBundle.load(fontAssetPath);
    final fontUri = getFontUri(fontData, fontMime).toString();
    final fontCss =
        '@font-face { font-size: ${37.sp}px; font-family: customFont; src: url($fontUri); } * { font-size: ${37.sp}px; font-family: customFont; }';
    return '<style>$fontCss</style>$htmlContent';
  }

  Widget buildWebView({String? htmlStr, String? linkUrl}) {
    return InAppWebView(
      key: webViewKey,
      // initialUrlRequest: URLRequest(url: Uri.parse("https://inappwebview.dev/")),
      initialOptions: options,
      pullToRefreshController: pullToRefreshController,
      onWebViewCreated: (controller) async {
        webViewController = controller;

        if (linkUrl != null) {
          webViewController?.loadUrl(urlRequest: URLRequest(url: Uri.parse(linkUrl)));
        } else if (htmlStr != null) {
          //generating html on the fly
          // htmlStr = "<div class=\"ck-content\"><p class=\"product-detail\"><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">Độ phân giải : 2.0 Megapixel</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">Cảm Biến : 1/2.8\" progressive scan CMOS</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Độ Nhạy Sáng : 0.01 Lux @(F1.2, AGC ON), 0 Lux with IR</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Ống Kính : 4mm (Tùy chọn 2.8mm/6mm)</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Tích hợp Micro</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Chuẩn nén video : H.265+/H.265/H.264+/H.264</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Kết Nối : 1 RJ45 10M/100M</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Chống Ngược Sáng : Digital WDR</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Hồng Ngoại : 30 mét</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Tiêu Chuẩn : IP67</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(63,66,84);\">Nguồn Cấp : 12 VDC ±25%,PoE (802.3af)</span></p><p class=\"product-detail\" style=\"font-family: helvetican !important;font-weight: 200 !important;\">&nbsp;</p><p class=\"product-detail\" style=\"font-family: helvetican !important;font-weight: 200 !important;\">&nbsp;</p></div><link rel=\"stylesheet\" href=\"http://45.117.171.8/plugins/custom/ckeditor/content-styles.css?v2\" type=\"text/css\">";
          // String htmlStrWithFont = await addFontToHtml(htmlStr, "assets/fonts/helveticaneue.ttf", "font/opentype");

          webViewController?.loadUrl(
              urlRequest: URLRequest(
                  url: Uri.dataFromString(htmlStr,
                      // '''<div class=\"ck-content\"><p><strong>Hiệu quả kiểm soát vi khuẩn </strong><i><strong>Vibrio</strong></i><strong> của 03 chế phẩm từ tự nhiên</strong></p><figure class=\"image\"><img onclick=\"javascript:window.location=this.src;\"  src=\"http://app.vinhthinhbiostadt.com.vn:9000/uploads/news_temp/ptymqr8agd-1611378646.jpg\"></figure><p><i>Hình - Trại sản xuất tôm giống thường áp dụng các phương pháp phân tích trong phòng thí nghiệm để kiểm soát mầm bệnh và gia tăng lợi nhuận (Nguồn: Darryl Jory)</i></p><p><span style=\"font-family:Arial, Helvetica, sans-serif;\">Hiện nay, các trại sản xuất tôm giống ở châu Mỹ và châu Á đang phải đối mặt với sự gia tăng ngày càng cao của bệnh truyền nhiễm. Đáng chú ý nhất là bệnh liên quan đến vi khuẩn <i>Vibrio spp</i>. (như <i>Vibrio harveyi</i>, <i>Vibrio alginolyticus</i> và <i>Vibrio campbellii</i>). Điển hình là trại giống ở Ecuador thường mắc một số bệnh do vi khuẩn Vibrio gây ra như hội chứng Bolitas nigricans (do vi khuẩn <i>V. harveyi</i>) và hội chứng Zoea 2 (do vi khuẩn <i>V. harveyi </i>và <i>V. alginolyticus)</i>. Do đó, việc xác định hiệu quả của chế phẩm từ tự nhiên sẽ có ảnh hưởng lớn đến việc kiểm soát bệnh trong nuôi trồng thủy sản.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kháng sinh:</strong> được sử dụng rộng rãi và là thuốc dự phòng khi có dịch bệnh xảy ra. Tuy nhiên, sử dụng kháng sinh thường dẫn đến dư lượng trong vật nuôi thủy sản, ảnh hưởng xấu đến phát triển và nhân giống, đặc biệt là tính đối kháng mầm bệnh, bao gồm cả bệnh trên người. Vì vậy, chính quyền các nước đã có quy định kiểm soát chặt chẽ khi sử dụng kháng sinh. Chiến lược sử dụng các chế phẩm tự nhiên để thay thế kháng sinh, kiểm soát mầm bệnh trong trại giống là cần thiết trong nuôi trồng thủy sản.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Chế phẩm sinh học:</strong> Hiệu quả của chế phẩm sinh học được thể hiện qua khả năng ức chế vi khuẩn của chúng trong đường ruột, đối kháng chọn lọc chống lại mầm bệnh, cải thiện hệ thống miễn dịch, gia tăng tỷ lệ sống và tăng trưởng của tôm, kiểm soát chất thải và duy trì chất lượng nước.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Acid hữu cơ: </strong>được sử dụng làm chất bảo quản và kiểm soát vi khuẩn trong thực phẩm, nông nghiệp.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Tinh dầu: </strong>đã được chứng minh là có đặc tính kháng khuẩn, chống oxy hóa và kháng nấm,&nbsp; thay thế cho việc sử dụng phụ gia trong sản xuất tôm giống.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Mặc dù việc sử dụng các sản phẩm tự nhiên như acid hữu cơ và tinh dầu trong trại giống ở Ecuador tương đối mới, nhưng nhu cầu ứng dụng của chúng ngày càng tăng. Để xác định chế phẩm nào có hiệu quả, trại sản xuất giống sẽ tiến hành các thử nghiệm bên trong cơ sở của họ.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Đầu tiên, trại sản xuất giống tôm ở Ecuador thực hiện một cuộc khảo sát để thu thập các chủng vi khuẩn gây bệnh hiện nay tại địa phương. Qua đó, độc lực của chúng được xác định thông qua quá trình cảm nhiễm, đồng thời phân lập để xác định mối tương quan với vi khuẩn Vibrio gây bệnh. Sau đó, trại sản xuất giống đã tiến hành 1 số thử nghiệm tại cơ sở để đánh giá hiệu quả kháng khuẩn của kháng sinh, men vi sinh, acid hữu cơ và tinh dầu.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Nội dung thử nghiệm</strong></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Thu 31 mẫu ấu trùng tôm thẻ chân trắng hoạt động bơi lội kém, trống ruột và chậm phát triển, <i>Litopenaeus vannamei</i> [từ Nauplii 5 (N5) đến postlarvae 13 (PL13)] từ các bể của 10 trại sản xuất giống tôm ở Santa Elena, Ecuador. Chúng được gửi đến Trung tâm Nghiên cứu Thủy sản và Nuôi trồng Thủy sản Quốc gia (Trung tâm nghiên cứu về sinh vật biển CENAIM, Santa Elena, Ecuador) để xác định hàm lượng vi khuẩn.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Các chủng vi khuẩn được phân lập, lưu trữ và cảm nhiễm gây bệnh trên tôm. Các chủng này được xác định bằng phương pháp PCR, phân tích trình tự 16S rRNA.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Sau cảm nhiễm, sử dụng 16 chế phẩm tự nhiên (5 loại chế phẩm sinh học, 9 loại acid hữu cơ, 2 loại tinh dầu) và 11 loại kháng sinh để xử lý và đánh giá hiệu quả.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kết quả và thảo luận</strong></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kháng sinh</strong> có hiệu quả trị liệu cao nhất, có khả năng ức chế sự phát triển của vi khuẩn gây bệnh, nhưng các các loại kháng sinh này không được phép sử dụng trong nuôi trồng thủy sản. Nghiên cứu này còn cho thấy chỉ số kháng kháng sinh (MAR) trung bình là 0,23.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Chỉ số kháng kháng sinh cao được tìm thấy trong tất cả trại sản xuất giống trên toàn thế giới, và đặc biệt cao rất nhiều trong các trang trại nuôi tôm thương phẩm. Ví dụ, chỉ số MAR dao động từ 0,21 - 0,38 đã được ghi nhận đối với vi khuẩn phân lập từ trại sản xuất tôm giống, nhưng chỉ số MAR trong trại nuôi tôm thương phẩm chỉ nằm trong khoảng từ 0,11 - 0,32.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Chỉ số MAR trung bình được xác định trong nghiên cứu này là thấp so với các giá trị được báo cáo trong các trại sản xuất giống tôm khác. Tuy nhiên, tất cả chủng vi khuẩn đều kháng cùng lúc với penicillin và oxytetracycline, cả hai loại kháng sinh được sử dụng trong y học. Nguyên nhân là do hầu hết mẫu thu từ các trại sản xuất giống nằm trong khu vực có nhiều hoạt động nhân tạo, không được xử lý nước thải, đây có thể là nguồn gây ô nhiễm kháng sinh.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Trong nghiên cứu này, chỉ có một loại <strong>chế phẩm sinh học</strong> thể hiện khả năng kháng khuẩn cao (85% chủng vi khuẩn). Các chế phẩm sinh học còn lại chỉ ức chế 15 - 30% chủng vi khuẩn. Tuy nhiên, trong đó có 2 chủng vi khuẩn không bị ức chế hoàn toàn bởi bất cứ loại chế phẩm sinh học nào.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Chỉ có một loại <strong>acid hữu cơ</strong> kiểm soát sự tăng trưởng của hầu hết các chủng vi khuẩn ở nồng độ thấp. Đó là hỗn hợp acid hữu cơ của acid axetic, acid propionic và acid formic. Các acid này, có hiệu quả trong việc kiểm soát <i>Vibrio</i> gây bệnh cho tôm và các sinh vật thủy sinh. Hỗn hợp acid hữu cơ hiệu quả thứ hai là acid lactic, fumaric, citric, malic và succinic. Ngoài ra, acid formic được xem là chất đặc biệt hiệu quả chống lại <i>Vibrio</i> gây bệnh và acid acetic có tác dụng mạnh mẽ với <i>V. parahaemolyticus.</i></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Tinh dầu</strong> oregano ức chế hiệu quả sự tăng trưởng của tất cả các chủng vi khuẩn trong nghiên cứu với giá trị MIC ≤ 3 mg/l. Các loại tinh dầu làm gián đoạn quá trình giao tiếp của vi khuẩn, giảm độc lực và khả năng gây bệnh của vi khuẩn. Hiệu quả ức chế vi khuẩn liên quan đến sự hiện diện của thymol và carvacrol, làm giảm số lượng vi khuẩn của <i>V. Vulnificus, V. parahaemolyticus </i>và<i> V. cholera</i> trong gan tôm thẻ chân trắng P. vannamei.</span><br><br><br><br><strong>Người dịch:</strong>&nbsp;<strong>Thạc sĩ&nbsp;Lê Hải Quỳnh - Công ty Vinhthinh Biostadt</strong><br><br><strong>Nguồn:</strong>&nbsp;https://www.aquaculturealliance.org/advocate/efficacy-natural-products-antibiotics-shrimp-hatcheries/<br>&nbsp;</p></div><link rel=\"stylesheet\" href=\"http://app.vinhthinhbiostadt.com.vn:9000/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">''',
                      mimeType: 'text/html',
                      encoding: Encoding.getByName('utf-8'))));
        }
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
      //   if (progress == 100) {
      //     pullToRefreshController.endRefreshing();
      //   }
      //   setState(() {
      //     this.progress = progress / 100;
      //     urlController.text = this.url;
      //   });
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
    );
  }
}
