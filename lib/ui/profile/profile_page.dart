import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_back.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/ui/profile/password/profile_change_password.dart';
import 'package:flutter_lehoang_extracare/ui/profile/profile_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/launcher_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import 'component/profile_menu_view.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorBackgroundDefault,
      body: BaseContainer(
        provider: profileViewModel,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopView(),
              SizedBox(height: 15.h),
              _buildMenuView(),
              SizedBox(height: 15.h),
              // _buildReferralView(),
              // SizedBox(height: 15.h),
              _buildLogoutView(),
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
            height: 350.h,
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
            child: Stack(
              children: [
                Positioned(
                    top: 10.h,
                    left: 5.w,
                    right: 0,
                    child: Row(
                      children: [
                        IconButtonBack(onPress: () {
                          Navigator.pop(context);
                        }),
                        Text('Tài khoản', style: styleTextWhite())
                      ],
                    )),
                Positioned(
                    top: 50.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                            child: ShimmerLoadingImage(
                          imageUrl: context.read(prefsProvider).getUser()?.avatarUrl ?? '',
                          width: 65.h,
                          height: 65.h,
                          fit: BoxFit.cover,
                        )),
                        SizedBox(height: 5.h),
                        RichText(
                          text: TextSpan(
                            text: 'Xin chào, ',
                            style: styleTextWhite(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: context.read(prefsProvider).getUser()?.name ?? 'username',
                                  style: styleTextWhiteBold()),
                            ],
                          ),
                        )
                      ],
                    )),
                Positioned(bottom: 0.h, left: 5.w, right: 5.w, child: _buildPointView()),
              ],
            ))
      ],
    );
  }

  Widget _buildPointView() {
    final user = context.read(prefsProvider).getUser();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: decorSolidRound(circularSize: 5.r, color: Colors.white, isShadow: true),
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                child: Column(
                  children: [
                    Text('${user?.recent_point ?? 0}đ', style: styleTextRedBold(17)),
                    SizedBox(height: 10.h),
                    Text('Điểm tích lũy', style: styleTextBlack(13)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              flex: 1,
              child: Container(
                decoration: decorSolidRound(circularSize: 5.r, color: Colors.white, isShadow: true),
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                child: Column(
                  children: [
                    Text('${user?.point_exchane ?? 0}đ', style: styleTextRedBold()),
                    SizedBox(height: 10.h),
                    Text('Điểm đổi quà', style: styleTextBlack(13)),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: decorSolidRound(circularSize: 5.r, color: Colors.white, isShadow: true),
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                child: Column(
                  children: [
                    Text('${user?.total_gift ?? 0}', style: styleTextRedBold()),
                    SizedBox(height: 10.h),
                    Text('Quà tặng đã đổi', style: styleTextBlack(13)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              flex: 1,
              child: Container(
                decoration: decorSolidRound(circularSize: 5.r, color: Colors.white, isShadow: true),
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                child: Column(
                  children: [
                    Text('${user?.total_scan ?? 0}', style: styleTextRedBold()),
                    SizedBox(height: 10.h),
                    Text('Số lần quét serial', style: styleTextBlack(13)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuView() {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          ProfileMenuView(
            text: 'Thông tin tài khoản',
            iconData: Assets.images.icMenuTopAccount,
            iconColor: Colors.red,
            onPress: () {
              Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageProfileUpdate);
            },
          ),
          ProfileMenuView(
            text: 'Mã QR của tôi',
            iconData: Assets.images.icProfileQrcode,
            onPress: () {
              Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageProfileQrCode);
            },
          ),
          Divider(height: 1.h, color: colorGrey),
          ProfileMenuView(
            // text: 'Lịch sử đăng ký serial & đổi quà tặng',
            text: 'Lịch sử đổi quà tặng',
            iconData: Assets.images.icProfileHistoryGift,
            onPress: () {
              Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageHistoryGift);
            },
          ),
          Divider(height: 1.h, color: colorGrey),
          ProfileMenuView(
            text: 'Lịch sử tích điểm',
            iconData: Assets.images.icProfileHistoryPoint,
            onPress: () {
              Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageHistoryPoint);
            },
          ),
          Divider(height: 1.h, color: colorGrey),
          ProfileMenuView(
            text: 'Đổi mã pin',
            iconData: Assets.images.icProfilePincode,
            onPress: () {
              Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageProfileChangePassword);
              //
              // _showChangePasswordBottomSheet();
            },
          ),
          Divider(height: 1.h, color: colorGrey),
          ProfileMenuView(
            text: 'Liên hệ',
            iconData: Assets.images.icProfileCall,
            onPress: () {
              Navigator.of(context, rootNavigator: true).pushNamed(Constants.pageContact);
            },
          ),
          Divider(height: 1.h, color: colorGrey),
          ProfileMenuView(
            text: 'Xoá tài khoản',
            iconData: Assets.images.icDelete,
            iconColor: Colors.red,
            onPress: () {
              final viewModel = context.read(profileViewModel);
              viewModel.deleteAccount().then((value){
                if(value.status == 200){
                  context.read(prefsProvider).clearData();
                  Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageLogin, (route) => false);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReferralView() {
    final referCode = context.read(prefsProvider).getUser()?.reference;

    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
        child: Row(
          children: [
            Assets.images.icProfileReferral.image(width: 19.h, height: 19.h),
            SizedBox(width: 15.w),
            Text('Mã giới thiệu: ${referCode ?? 'Không có'}', style: styleTextBlack()),
            Spacer(),
            InkWell(
                onTap: () {
                  openShareText(referCode ?? '');
                },
                child: Text('Chia sẻ', style: styleTextBlueBold())),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutView() {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.read(prefsProvider).clearData();
          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageLogin, (route) => false);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
          child: Row(
            children: [
              Assets.images.icProfileLogout.image(width: 19.h, height: 19.h),
              SizedBox(width: 15.w),
              Text('Đăng xuất', style: styleTextRed())
            ],
          ),
        ),
      ),
    );
  }

  void _showChangePasswordBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => ProfileChangePassword(),
    );
  }
}
