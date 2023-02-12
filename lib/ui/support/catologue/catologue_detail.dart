import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catalogue.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/pageturn/custom_page_turn.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'catologue_detail_view_model.dart';

class CatologueDetailPage extends StatefulWidget {
  @override
  _CatologueDetailPageState createState() => _CatologueDetailPageState();
}

class _CatologueDetailPageState extends State<CatologueDetailPage> {
  final _controller = GlobalKey<CustomPageTurnState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    final catalogue = value as Catalogue;

    final viewModel = context.read(catologueDetailViewModel);
    viewModel.setLinkCatalogue(catalogue.link);

    // final catologueId = value as int;
    // final viewModel = context.read(catologueDetailViewModel);
    // viewModel.loadCatalogueLink(catologueId);

    var title = catalogue.name ?? 'Catologue';
    // switch (catalogue) {
    //   case 1:
    //     title = 'Catologue Miền Bắc';
    //     break;
    //   case 2:
    //     title = 'Catologue Miền Trung';
    //     break;
    //   case 3:
    //     title = 'Catologue Miền Nam';
    //     break;
    // }

    return BaseContainer(
      provider: catologueDetailViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: Column(
          children: [
            CommonTopbar(title),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return HookBuilder(builder: (_) {
      final link = useProvider(catologueDetailViewModel.select((value) => value.linkCatalogue));

      if (link == null || link.isEmpty)
        return Container(
          child: Center(
            child: Text('Không có link cho Catalogue này'),
          ),
        );
      return Container(
          width: double.infinity,
          height: double.infinity,
          // child : buildWebView(linkUrl: link)
          child: WebView(
            initialUrl: Uri.dataFromString(
                    '<html><body><iframe src="${link}" width="100%" height="100%"></iframe></body></html>',
                    mimeType: 'text/html')
                .toString(),
            javascriptMode: JavascriptMode.unrestricted,
          ),
      );
    });
  }

// Widget _buildMainView() {
// return HookBuilder(builder: (_) {
//   final imageUrlList = useProvider(catologueDetailViewModel.select((value) => value.imageUrlList));
//   final preloadCount = useProvider(catologueDetailViewModel.select((value) => value.preloadCount));
//
//   if (imageUrlList == null || imageUrlList.isEmpty)
//     return Center(
//       child: Text('Không có hình ảnh nào'),
//     );
//
//   print('imageUrlList.length : ${imageUrlList.length}');
//
//   if (preloadCount == 0) {
//     _preloadImageCatologue(imageUrlList);
//     return LoadingCircular();
//   } else {
//     return CustomPageTurn(
//       key: _controller,
//       backgroundColor: Colors.white,
//       showDragCutoff: false,
//       duration: const Duration(milliseconds: 700),
//       cutoff: 0.5,
//       lastPage: Container(),
//       children: <Widget>[
//         // Assets.images.imgNoData.image(width: 200.w, height: 200.w),
//         for (var i = 0; i < imageUrlList.length; i++)
//           LoadingImage(
//               imageUrl: imageUrlList[i], width: 1.sw, height: 1.sh, fit: BoxFit.cover),
//       ],
//     );
//   }
// });
// }

// void _preloadImageCatologue(List<String?> imageUrlList) {
//   // try {
//     Future.delayed(Duration.zero, () {
//       Future.wait([
//         for (var i = 0; i < imageUrlList.length; i++)
//           precacheImage(
//               Image(
//                 image: CachedNetworkImageProvider(imageUrlList[i]),
//                 fit: BoxFit.cover,
//               ).image,
//               context)
//       ]).timeout(Duration(seconds: 3), onTimeout: () => []).then((value) {
//         print('context.read(catologueDetailViewModel).updatePreLoad()');
//         context.read(catologueDetailViewModel).updatePreLoad();
//       });
//     });
//   // } catch (e) {
//   // }
// }
}
