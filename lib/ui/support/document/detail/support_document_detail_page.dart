import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/ui/support/document/detail/support_document_detail_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportDocumentDetailPage extends StatefulWidget {
  @override
  _SupportDocumentDetailPageState createState() => _SupportDocumentDetailPageState();
}

class _SupportDocumentDetailPageState extends State<SupportDocumentDetailPage> {
  //Setting InAppWebView
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
  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
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

  SupportObject? _document;

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value != null) _document = value as SupportObject;

    return BaseContainer(
      provider: supportDocumentDetailViewModel,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            CommonTopbar(_document?.name ?? 'T??i li???u'),
            SizedBox(height: 10.h),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainView() {
    if (_document?.list_images != null && _document?.list_images?.isNotEmpty == true) {
      return _buildLoadBodyView();
    } else if (_document?.document_file != null) {
      return _buildMainPdfView();
    } else
      return SizedBox();
  }

  Widget _buildLoadBodyView() {
    return InAppWebView(
      key: webViewKey,
      // initialUrlRequest: URLRequest(url: Uri.parse("https://www.hikvisionvietnam.vn")),
      initialOptions: options,
      pullToRefreshController: pullToRefreshController,
      onWebViewCreated: (controller) {
        webViewController = controller;
        webViewController?.loadUrl(
            urlRequest: URLRequest(
                url: Uri.dataFromString(_document?.body ?? '',
                    // '''<div class=\"ck-content\"><p><strong>Hi???u qu??? ki???m so??t vi khu???n </strong><i><strong>Vibrio</strong></i><strong> c???a 03 ch??? ph???m t??? t??? nhi??n</strong></p><figure class=\"image\"><img onclick=\"javascript:window.location=this.src;\"  src=\"http://app.vinhthinhbiostadt.com.vn:9000/uploads/news_temp/ptymqr8agd-1611378646.jpg\"></figure><p><i>H??nh - Tr???i s???n xu???t t??m gi???ng th?????ng ??p d???ng c??c ph????ng ph??p ph??n t??ch trong ph??ng th?? nghi???m ????? ki???m so??t m???m b???nh v?? gia t??ng l???i nhu???n (Ngu???n: Darryl Jory)</i></p><p><span style=\"font-family:Arial, Helvetica, sans-serif;\">Hi???n nay, c??c tr???i s???n xu???t t??m gi???ng ??? ch??u M??? v?? ch??u ?? ??ang ph???i ?????i m???t v???i s??? gia t??ng ng??y c??ng cao c???a b???nh truy???n nhi???m. ????ng ch?? ?? nh???t l?? b???nh li??n quan ?????n vi khu???n <i>Vibrio spp</i>. (nh?? <i>Vibrio harveyi</i>, <i>Vibrio alginolyticus</i> v?? <i>Vibrio campbellii</i>). ??i???n h??nh l?? tr???i gi???ng ??? Ecuador th?????ng m???c m???t s??? b???nh do vi khu???n Vibrio g??y ra nh?? h???i ch???ng Bolitas nigricans (do vi khu???n <i>V. harveyi</i>) v?? h???i ch???ng Zoea 2 (do vi khu???n <i>V. harveyi </i>v?? <i>V. alginolyticus)</i>. Do ????, vi???c x??c ?????nh hi???u qu??? c???a ch??? ph???m t??? t??? nhi??n s??? c?? ???nh h?????ng l???n ?????n vi???c ki???m so??t b???nh trong nu??i tr???ng th???y s???n.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kh??ng sinh:</strong> ???????c s??? d???ng r???ng r??i v?? l?? thu???c d??? ph??ng khi c?? d???ch b???nh x???y ra. Tuy nhi??n, s??? d???ng kh??ng sinh th?????ng d???n ?????n d?? l?????ng trong v???t nu??i th???y s???n, ???nh h?????ng x???u ?????n ph??t tri???n v?? nh??n gi???ng, ?????c bi???t l?? t??nh ?????i kh??ng m???m b???nh, bao g???m c??? b???nh tr??n ng?????i. V?? v???y, ch??nh quy???n c??c n?????c ???? c?? quy ?????nh ki???m so??t ch???t ch??? khi s??? d???ng kh??ng sinh. Chi???n l?????c s??? d???ng c??c ch??? ph???m t??? nhi??n ????? thay th??? kh??ng sinh, ki???m so??t m???m b???nh trong tr???i gi???ng l?? c???n thi???t trong nu??i tr???ng th???y s???n.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Ch??? ph???m sinh h???c:</strong> Hi???u qu??? c???a ch??? ph???m sinh h???c ???????c th??? hi???n qua kh??? n??ng ???c ch??? vi khu???n c???a ch??ng trong ???????ng ru???t, ?????i kh??ng ch???n l???c ch???ng l???i m???m b???nh, c???i thi???n h??? th???ng mi???n d???ch, gia t??ng t??? l??? s???ng v?? t??ng tr?????ng c???a t??m, ki???m so??t ch???t th???i v?? duy tr?? ch???t l?????ng n?????c.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Acid h???u c??: </strong>???????c s??? d???ng l??m ch???t b???o qu???n v?? ki???m so??t vi khu???n trong th???c ph???m, n??ng nghi???p.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Tinh d???u: </strong>???? ???????c ch???ng minh l?? c?? ?????c t??nh kh??ng khu???n, ch???ng oxy h??a v?? kh??ng n???m,&nbsp; thay th??? cho vi???c s??? d???ng ph??? gia trong s???n xu???t t??m gi???ng.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">M???c d?? vi???c s??? d???ng c??c s???n ph???m t??? nhi??n nh?? acid h???u c?? v?? tinh d???u trong tr???i gi???ng ??? Ecuador t????ng ?????i m???i, nh??ng nhu c???u ???ng d???ng c???a ch??ng ng??y c??ng t??ng. ????? x??c ?????nh ch??? ph???m n??o c?? hi???u qu???, tr???i s???n xu???t gi???ng s??? ti???n h??nh c??c th??? nghi???m b??n trong c?? s??? c???a h???.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">?????u ti??n, tr???i s???n xu???t gi???ng t??m ??? Ecuador th???c hi???n m???t cu???c kh???o s??t ????? thu th???p c??c ch???ng vi khu???n g??y b???nh hi???n nay t???i ?????a ph????ng. Qua ????, ?????c l???c c???a ch??ng ???????c x??c ?????nh th??ng qua qu?? tr??nh c???m nhi???m, ?????ng th???i ph??n l???p ????? x??c ?????nh m???i t????ng quan v???i vi khu???n Vibrio g??y b???nh. Sau ????, tr???i s???n xu???t gi???ng ???? ti???n h??nh 1 s??? th??? nghi???m t???i c?? s??? ????? ????nh gi?? hi???u qu??? kh??ng khu???n c???a kh??ng sinh, men vi sinh, acid h???u c?? v?? tinh d???u.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>N???i dung th??? nghi???m</strong></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Thu 31 m???u ???u tr??ng t??m th??? ch??n tr???ng ho???t ?????ng b??i l???i k??m, tr???ng ru???t v?? ch???m ph??t tri???n, <i>Litopenaeus vannamei</i> [t??? Nauplii 5 (N5) ?????n postlarvae 13 (PL13)] t??? c??c b??? c???a 10 tr???i s???n xu???t gi???ng t??m ??? Santa Elena, Ecuador. Ch??ng ???????c g???i ?????n Trung t??m Nghi??n c???u Th???y s???n v?? Nu??i tr???ng Th???y s???n Qu???c gia (Trung t??m nghi??n c???u v??? sinh v???t bi???n CENAIM, Santa Elena, Ecuador) ????? x??c ?????nh h??m l?????ng vi khu???n.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">C??c ch???ng vi khu???n ???????c ph??n l???p, l??u tr??? v?? c???m nhi???m g??y b???nh tr??n t??m. C??c ch???ng n??y ???????c x??c ?????nh b???ng ph????ng ph??p PCR, ph??n t??ch tr??nh t??? 16S rRNA.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Sau c???m nhi???m, s??? d???ng 16 ch??? ph???m t??? nhi??n (5 lo???i ch??? ph???m sinh h???c, 9 lo???i acid h???u c??, 2 lo???i tinh d???u) v?? 11 lo???i kh??ng sinh ????? x??? l?? v?? ????nh gi?? hi???u qu???.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>K???t qu??? v?? th???o lu???n</strong></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Kh??ng sinh</strong> c?? hi???u qu??? tr??? li???u cao nh???t, c?? kh??? n??ng ???c ch??? s??? ph??t tri???n c???a vi khu???n g??y b???nh, nh??ng c??c c??c lo???i kh??ng sinh n??y kh??ng ???????c ph??p s??? d???ng trong nu??i tr???ng th???y s???n. Nghi??n c???u n??y c??n cho th???y ch??? s??? kh??ng kh??ng sinh (MAR) trung b??nh l?? 0,23.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Ch??? s??? kh??ng kh??ng sinh cao ???????c t??m th???y trong t???t c??? tr???i s???n xu???t gi???ng tr??n to??n th??? gi???i, v?? ?????c bi???t cao r???t nhi???u trong c??c trang tr???i nu??i t??m th????ng ph???m. V?? d???, ch??? s??? MAR dao ?????ng t??? 0,21 - 0,38 ???? ???????c ghi nh???n ?????i v???i vi khu???n ph??n l???p t??? tr???i s???n xu???t t??m gi???ng, nh??ng ch??? s??? MAR trong tr???i nu??i t??m th????ng ph???m ch??? n???m trong kho???ng t??? 0,11 - 0,32.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Ch??? s??? MAR trung b??nh ???????c x??c ?????nh trong nghi??n c???u n??y l?? th???p so v???i c??c gi?? tr??? ???????c b??o c??o trong c??c tr???i s???n xu???t gi???ng t??m kh??c. Tuy nhi??n, t???t c??? ch???ng vi khu???n ?????u kh??ng c??ng l??c v???i penicillin v?? oxytetracycline, c??? hai lo???i kh??ng sinh ???????c s??? d???ng trong y h???c. Nguy??n nh??n l?? do h???u h???t m???u thu t??? c??c tr???i s???n xu???t gi???ng n???m trong khu v???c c?? nhi???u ho???t ?????ng nh??n t???o, kh??ng ???????c x??? l?? n?????c th???i, ????y c?? th??? l?? ngu???n g??y ?? nhi???m kh??ng sinh.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Trong nghi??n c???u n??y, ch??? c?? m???t lo???i <strong>ch??? ph???m sinh h???c</strong> th??? hi???n kh??? n??ng kh??ng khu???n cao (85% ch???ng vi khu???n). C??c ch??? ph???m sinh h???c c??n l???i ch??? ???c ch??? 15 - 30% ch???ng vi khu???n. Tuy nhi??n, trong ???? c?? 2 ch???ng vi khu???n kh??ng b??? ???c ch??? ho??n to??n b???i b???t c??? lo???i ch??? ph???m sinh h???c n??o.</span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\">Ch??? c?? m???t lo???i <strong>acid h???u c??</strong> ki???m so??t s??? t??ng tr?????ng c???a h???u h???t c??c ch???ng vi khu???n ??? n???ng ????? th???p. ???? l?? h???n h???p acid h???u c?? c???a acid axetic, acid propionic v?? acid formic. C??c acid n??y, c?? hi???u qu??? trong vi???c ki???m so??t <i>Vibrio</i> g??y b???nh cho t??m v?? c??c sinh v???t th???y sinh. H???n h???p acid h???u c?? hi???u qu??? th??? hai l?? acid lactic, fumaric, citric, malic v?? succinic. Ngo??i ra, acid formic ???????c xem l?? ch???t ?????c bi???t hi???u qu??? ch???ng l???i <i>Vibrio</i> g??y b???nh v?? acid acetic c?? t??c d???ng m???nh m??? v???i <i>V. parahaemolyticus.</i></span><br><br><span style=\"font-family:Arial, Helvetica, sans-serif;\"><strong>Tinh d???u</strong> oregano ???c ch??? hi???u qu??? s??? t??ng tr?????ng c???a t???t c??? c??c ch???ng vi khu???n trong nghi??n c???u v???i gi?? tr??? MIC ??? 3 mg/l. C??c lo???i tinh d???u l??m gi??n ??o???n qu?? tr??nh giao ti???p c???a vi khu???n, gi???m ?????c l???c v?? kh??? n??ng g??y b???nh c???a vi khu???n. Hi???u qu??? ???c ch??? vi khu???n li??n quan ?????n s??? hi???n di???n c???a thymol v?? carvacrol, l??m gi???m s??? l?????ng vi khu???n c???a <i>V. Vulnificus, V. parahaemolyticus </i>v??<i> V. cholera</i> trong gan t??m th??? ch??n tr???ng P. vannamei.</span><br><br><br><br><strong>Ng?????i d???ch:</strong>&nbsp;<strong>Th???c s??&nbsp;L?? H???i Qu???nh - C??ng ty Vinhthinh Biostadt</strong><br><br><strong>Ngu???n:</strong>&nbsp;https://www.aquaculturealliance.org/advocate/efficacy-natural-products-antibiotics-shrimp-hatcheries/<br>&nbsp;</p></div><link rel=\"stylesheet\" href=\"http://app.vinhthinhbiostadt.com.vn:9000/plugins/custom/ckeditor/content-styles.css?v=3\" type=\"text/css\">''',
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
      onLoadStop: (controller, url) async {
        pullToRefreshController.endRefreshing();
        setState(() {
          this.url = url.toString();
          urlController.text = this.url;
        });
      },
      onLoadError: (controller, url, code, message) {
        pullToRefreshController.endRefreshing();
      },
      onProgressChanged: (controller, progress) {
        if (progress == 100) {
          pullToRefreshController.endRefreshing();
        }
        setState(() {
          this.progress = progress / 100;
          urlController.text = this.url;
        });
      },
      onUpdateVisitedHistory: (controller, url, androidIsReload) {
        setState(() {
          this.url = url.toString();
          urlController.text = this.url;
        });
      },
      onConsoleMessage: (controller, consoleMessage) {
        print(consoleMessage);
      },
    );
  }

  Widget _buildMainPdfView() {
    String? url =
        'https://www.hikvisionvietnam.vn/uploads/huongdansudung/x%c3%b3a%20t%c3%a0i%20kho%e1%ba%a3n%20hik-connect.pdf';
    if (_document?.document_file != null && _document?.document_file?.isNotEmpty == true) {
      url = _document?.document_file;
    }

    return SfPdfViewer.network(
      url,
      pageSpacing: 10.h,
    );
  }

}
