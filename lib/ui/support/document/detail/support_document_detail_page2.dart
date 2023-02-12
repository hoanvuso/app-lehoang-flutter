import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_close.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/ui/support/document/detail/support_document_detail_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportDocumentDetailPage2 extends StatefulWidget {
  @override
  _SupportDocumentDetailPage2State createState() => _SupportDocumentDetailPage2State();
}

class _SupportDocumentDetailPage2State extends State<SupportDocumentDetailPage2> {
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

  SupportObject? _document;

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

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value != null) _document = value as SupportObject;

    return BaseContainer(
      provider: supportDocumentDetailViewModel,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: double.infinity,
            child: Column(
              children: [
                CommonTopbar(_document?.name ?? 'Tài liệu'),
                SizedBox(height: 10.h),
                Expanded(child: _buildMainView()),
              ],
            ),
          ),
          _buildFullScreenImageView()
        ],
      ),
    );
  }

  Widget _buildMainView() {
    if (_document?.list_images != null && _document?.list_images?.isNotEmpty == true) {
      return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _document?.list_images?.length ?? 0,
          itemBuilder: (context, index) {
            final item = _document?.list_images?[index];
            return InkWell(
                onTap: () {
                  final viewModel = context.read(supportDocumentDetailViewModel);
                  viewModel.setZoomImageUrl(item);
                },
                child: Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: ShimmerLoadingImage(imageUrl: item, width: double.infinity, height: 0.55.sw)));
          });
    } else if (_document?.document_file != null) {
      return _buildMainPdfView();
    } else
      return SizedBox();
  }

  Widget _buildMainPdfView() {
    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(url: Uri.parse("https://inappwebview.dev/")),
      initialOptions: options,
      pullToRefreshController: pullToRefreshController,
      onWebViewCreated: (controller) {
        webViewController = controller;
        webViewController?.loadUrl(urlRequest: URLRequest(url: Uri.parse(_document?.document_file ?? "")));
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
      onConsoleMessage: (controller, consoleMessage) {
        print(consoleMessage);
      },
    );
  }

  Widget _buildFullScreenImageView() {
    return HookBuilder(builder: (_) {
      final imageUrl = useProvider(supportDocumentDetailViewModel.select((value) => value.zoomImageUrl));
      if (imageUrl == null) return SizedBox();
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            PhotoView(imageProvider: CachedNetworkImageProvider(imageUrl)),
            Positioned(
              right: 20.w,
              top: 50.h,
              child: IconButtonClose(
                onPress: () {
                  final viewModel = context.read(supportDocumentDetailViewModel);
                  viewModel.setZoomImageUrl(null);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
