import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_notification.dart';
import 'package:flutter_lehoang_extracare/resources/component/custom/inwell_custom.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/ui/home/component/item_product_home.dart';
import 'package:flutter_lehoang_extracare/ui/home/component/item_promotion_home.dart';
import 'package:flutter_lehoang_extracare/ui/home/component/top_menu_button.dart';
import 'package:flutter_lehoang_extracare/ui/home/home_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/master/master_page_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';
import 'component/item_tech_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final viewModel = context.read(homeViewModel);
      viewModel.loadUser();
      viewModel.loadUnreadNewsCount();
      viewModel
          .doWithLoadingMulti([viewModel.loadProductHome(), viewModel.loadPromotionHome(), viewModel.loadTechHome()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      provider: homeViewModel,
      child: Container(
        color: colorBackgroundDefault,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopView(),
              SizedBox(height: 5.h),
              _buildPromotionView(),
              SizedBox(height: 15.h),
              _buildProductView(),
              SizedBox(height: 15.h),
              _buildTechView(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopView() {
    return Stack(
      children: [
        Assets.images.backgroundHome.image(width: double.infinity, height: 220.h, fit: BoxFit.cover),
        Container(
            height: 260.h,
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
            child: Stack(
              children: [
                Positioned(top: 10.h, left: 0, right: 0, child: _buildAccountTopView()),
                Positioned(top: 75.h, left: 0, right: 0, child: _buildMenuTopView()),
                Positioned(bottom: 0.h, left: 5.w, right: 5.w, child: _buildPointTopView()),
              ],
            ))
      ],
    );
  }

  Widget _buildAccountTopView() {
    return HookBuilder(
      builder: (_) {
        final user = useProvider(broadCastProvider.select((value) => value.currentUser));
        // final user = useProvider(homeViewModel.select((value) => value.user));
        return Container(
          height: 50.h,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (checkNotLogin()) return;
                  Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageProfileUpdate).then((value) {
                    context.read(homeViewModel).loadUser();
                  });
                },
                child: ClipOval(
                    child: ShimmerLoadingImage(
                  imageUrl: user?.avatarUrl ?? '',
                  width: 40.h,
                  height: 40.h,
                  fit: BoxFit.cover,
                )),
              ),
              SizedBox(width: 10.w),
              RichText(
                text: TextSpan(
                  text: 'Xin chào, ',
                  style: styleTextWhite(),
                  children: <TextSpan>[
                    TextSpan(text: user?.name ?? 'Người dùng', style: styleTextWhiteBold()),
                  ],
                ),
              ),
              Spacer(),
              IconNotification(onPress: () {
                if (checkNotLogin()) return;
                Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageNotifications).then((value) {
                  context.read(homeViewModel).loadUnreadNewsCount();
                });
              })
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuTopView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: TopMenuButton(
              text: 'Giới thiệu',
              iconData: Assets.images.icMenuTopIntroduce,
              onPress: () {
                Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageIntroduce);
              }),
        ),
        Expanded(
            flex: 1,
            child: TopMenuButton(
                text: 'Đổi thưởng',
                iconData: Assets.images.icMenuTopGift,
                onPress: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageGiftList);
                })),
        Expanded(
            flex: 1,
            child: TopMenuButton(
                text: 'Thử thách',
                iconData: Assets.images.icMenuTopThuthach,
                onPress: () {
                  if (checkNotLogin()) return;
                  Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageChallenge);
                })),
        Expanded(
            flex: 1,
            child: TopMenuButton(
                text: 'Tài khoản',
                iconData: Assets.images.icMenuTopAccount,
                onPress: () {
                  if (checkNotLogin()) return;
                  Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageProfile);
                })),
      ],
    );
  }

  Widget _buildPointTopView() {
    return InkwellCustom(
      onTap: () {
        if (checkNotLogin()) return;
        Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageHistoryPoint);
      },
      radius: 10.r,
      color: Colors.white,
      isShadow: true,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: colorRedDark, size: 25.h),
            SizedBox(width: 10.w),
            Text('Điểm hiện tại:', style: styleTextBlack()),
            Spacer(),
            HookBuilder(builder: (_) {
              final user = useProvider(broadCastProvider.select((value) => value.currentUser));
              // final user = useProvider(homeViewModel.select((value) => value.user));
              return Text(user?.recent_point?.toString() ?? '0', style: styleTextRedBold(18));
            })
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionView() {
    return Material(
      color: Colors.white,
      child: Container(
        height: 250.h,
        padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 15.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.icHomePromotion.image(width: 25.h, height: 25.h),
                SizedBox(width: 10.w),
                Text('KHUYẾN MÃI', style: styleTextBlack()),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Constants.pagePromotion);
                    context.read(masterPageViewModel).addPageToBackStack(Constants.pagePromotion);
                  },
                  child: Row(
                    children: [
                      Text('Tất cả', style: styleTextBlackBold()),
                      SizedBox(width: 5.w),
                      Icon(Icons.arrow_forward_ios, size: 15.h, color: Colors.black),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 10.h),
            HookBuilder(builder: (_) {
              final list = useProvider(homeViewModel.select((value) => value.promotionList));
              return Container(
                height: 180.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list?.length ?? 5,
                  itemBuilder: (context, index) {
                    final item = list?[index];
                    if (item == null) {
                      return ShimmerPromotion();
                    } else
                      return ItemPromotionHome(item);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildProductView() {
    return Material(
      color: Colors.white,
      child: Container(
        height: 300.h,
        padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 15.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.icHomeProduct.image(width: 25.h, height: 25.h),
                SizedBox(width: 10.w),
                Text('SẢN PHẨM MỚI', style: styleTextBlack()),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, Constants.pageProductCompany, (route) => route.isFirst);
                    context.read(masterPageViewModel).addPageToBackStack(Constants.pageProductCompany);
                  },
                  child: Row(
                    children: [
                      Text('Tất cả', style: styleTextBlackBold()),
                      SizedBox(width: 5.w),
                      Icon(Icons.arrow_forward_ios, size: 15.h, color: Colors.black),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 10.h),
            HookBuilder(builder: (_) {
              final list = useProvider(homeViewModel.select((value) => value.productList));
              return Container(
                height: 230.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list?.length ?? 5,
                  itemBuilder: (context, index) {
                    final item = list?[index];
                    if (item == null) {
                      return ShimmerProduct();
                    } else
                      return ItemProductHome(item);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildTechView() {
    return Material(
      color: Colors.white,
      child: Container(
        height: 250.h,
        padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 15.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.icHomeTech.image(width: 25.h, height: 25.h),
                SizedBox(width: 10.w),
                Text('CÔNG NGHỆ', style: styleTextBlack()),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Constants.pageTech);
                    // context.read(masterPageViewModel).addPageToBackStack(Constants.pageTech);
                  },
                  child: Row(
                    children: [
                      Text('Tất cả', style: styleTextBlackBold()),
                      SizedBox(width: 5.w),
                      Icon(Icons.arrow_forward_ios, size: 15.h, color: Colors.black),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 10.h),
            HookBuilder(builder: (_) {
              final list = useProvider(homeViewModel.select((value) => value.techList));
              return Container(
                height: 180.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list?.length ?? 5,
                  itemBuilder: (context, index) {
                    final item = list?[index];
                    if (item == null) {
                      return ShimmerTechHome();
                    } else
                      return ItemTechHome(item);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  bool checkNotLogin() {
    final isLogged = context.read(prefsProvider).getUser() != null;
    if (!isLogged) {
      showToast(context: context, message: "Bạn phải đăng nhập để sử dụng tính năng này");
      Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageLogin);
      return true;
    }
    return false;
  }
}
