import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../master_page_view_model.dart';

class BottomBarButton extends StatelessWidget {
  final String text;
  final AssetGenImage? iconData;

  //to adjust size icon because icon PNG by design download size not equal
  final double? iconWidth;
  final double? iconHeight;

  final VoidCallback? onPress;
  final MasterPageTab? tab;

  BottomBarButton(
      {required this.text, this.iconData, this.onPress, this.tab, this.iconWidth, this.iconHeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
        child: HookBuilder(builder: (_) {
          final currentTab = useProvider(masterPageViewModel.select((value) => value.tab));
          if (tab != null && currentTab == tab) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                iconData?.image(
                        width: iconWidth ?? 25.h,
                        height: iconHeight ?? 25.h,
                        color: colorPrimary,
                        fit: BoxFit.fitWidth) ??
                    SizedBox(height: 25.h),
                SizedBox(height: 5.h),
                Text(
                  text,
                  style: styleTextPrimaryBold(12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                iconData?.image(
                        width: iconWidth ?? 25.h, height: iconHeight ?? 25.h, color: colorGrey, fit: BoxFit.fitWidth) ??
                    SizedBox(height: 25.h),
                SizedBox(height: 5.h),
                Text(text, style: styleTextGrey(12), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            );
          }
        }),
      ),
    );
  }
}
