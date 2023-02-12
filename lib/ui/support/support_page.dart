import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/ui/support/support_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'component/support_menu_view.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read(supportViewModel);
    viewModel.loadCatalogueList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      provider: supportViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: Column(
          children: [
            CommonTopbar('Hỗ trợ'),
            SizedBox(height: 10.h),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Column(
        children: [
          _buildCatalogueView(),
          // SupportMenuView('Catologue Miền Bắc', () {
          //   Navigator.pushNamed(context, Constants.pageSupportCatologue, arguments: 1);
          // }),
          // SizedBox(height: 10.h),
          // SupportMenuView('Catologe Miền Trung', () {
          //   Navigator.pushNamed(context, Constants.pageSupportCatologue, arguments: 2);
          // }),
          // SizedBox(height: 10.h),
          // SupportMenuView('Catologue Miên Nam', () {
          //   Navigator.pushNamed(context, Constants.pageSupportCatologue, arguments: 3);
          // }),
          // SizedBox(height: 10.h),
          SupportMenuView('Giải Pháp', () {
            Navigator.pushNamed(context, Constants.pageSupportSolution);
          }),
          SizedBox(height: 10.h),
          SupportMenuView('Tài Liệu', () {
            Navigator.pushNamed(context, Constants.pageSupportDocument);
          }),
          SizedBox(height: 10.h),
          SupportMenuView('Các Câu Hỏi thường gặp', () {
            Navigator.pushNamed(context, Constants.pageSupportQuestion);
          }),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildCatalogueView() {
    return HookBuilder(builder: (_) {
      final list = useProvider(supportViewModel.select((value) => value.listCatalogue));
      return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list?.length ?? 0,
        itemBuilder: (context, index) {
          final item = list?[index];
          return Column(
            children: [
              SupportMenuView(item?.name ?? '', () {
                Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageSupportCatologue, arguments: item);
                // Navigator.pushNamed(context, Constants.pageSupportCatologue, arguments: item);
              }),
              SizedBox(height: 10.h),
            ],
          );
        },
      );
    });
  }

  void _preloadImageCatologue() {
    Future.delayed(Duration.zero, () {
      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://media.ngoisao.vn/resize_580/news/2018/11/26/hotgirl-1-ngoisao.vn-w600-h493.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://i.vietgiaitri.com/2020/6/3/xinh-dep-lai-co-minh-day-cung-nguc-day-hotgirl-len-hinh-ben-bo-ma-bi-don-cap-dai-gia-19f-4981007.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://images.vietnamdaily.net.vn/zoomh/430/uploaded/nguyenanhson/2019_03_24/3/than-hinh-nong-bong-cua-hotgirl-dong-phuc-Hinh-2.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://gamek.mediacdn.vn/133514250583805952/2020/9/13/photo-1-15999725314761283427672.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://storage.oxii.vn/Cache/Sites/OXII/Storage/Images/2019/2/26/1920/ke-ni-nang-hotgirl-lanh-lung-khong-bao-gio-nhoen-mieng-cuoi-anh-2_957_651_82.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://we25.vn/media2018/Img_News/2019/06/27/loat-hotgirl-the-he-10x_20190627232253.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://streaming1.danviet.vn/upload/1-2020/images/2020-03-13/anh-17-1584088794-width650height768.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://media.doisongphapluat.com/684/2020/7/21/gai-xinh-tha-thinh-bang-nu-hon-ngot-ngao-nhieu-nam-sinh-hi-hung-cho-doi-va-cai-ket-cuoi-ra-nuoc-mat-dspl-1.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://1.bp.blogspot.com/-xmLV-ndC7M8/XszBqHMA_xI/AAAAAAAAmJA/53uO3K3Y9okVlMBsfqnQeFVp0DpxqcreQCLcBGAsYHQ/s1600/Anh-gai-xinh-deo-kinh%2B%252818%2529.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://hazomi.com/wp-content/uploads/2020/03/70616fe6ce53e9fedc661b4cbcf4234d.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image:
                CachedNetworkImageProvider('https://i.pinimg.com/564x/cf/e9/e5/cfe9e5abd920a3a57a90157febefe7b7.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://imagethumb.thethao247.vn/thumbamp/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://2.bp.blogspot.com/-vKar87uxvs8/XbmBTGqKoCI/AAAAAAAAiZk/Hu2_QCjAnHImrasbFt4dv0CjxgGLGfUvACLcBGAsYHQ/s1600/gai-xinh-1.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://ttol.vietnamnetjsc.vn/images/2019/08/14/06/43/nu-dien-vien-phu-phim-Ve-nha-di-con-2.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://we25.vn/media2018/Img_News/2019/09/27/hoi-gai-xinh-viet-noi-tieng-mxh-trung-quoc-nguoi-nhan-sac-ngang-ngua-linh-ka-ke-thu-nhap-70-trieu-thang-1_20190927160054.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);

      precacheImage(
          Image(
            image: CachedNetworkImageProvider('https://2sao.vietnamnetjsc.vn/images/2016/10/29/11/08/hongngoc10.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);
      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://mcvideomd1fr.keeng.net/playnow/images/channel/avatar/20181109/0973824256_20181027032607.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);
      precacheImage(
          Image(
            image: CachedNetworkImageProvider(
                'https://3.bp.blogspot.com/-Aee0g6oFj5M/WtP6rZqY4wI/AAAAAAAAACc/r6--Jq04HGMLDjjUMC7lW0ulvZeR6jYAQCLcBGAs/s1600/212310618041193431006884986278710988847462n-1507458620893.jpg'),
            fit: BoxFit.cover,
          ).image,
          context);
    });
  }
}
