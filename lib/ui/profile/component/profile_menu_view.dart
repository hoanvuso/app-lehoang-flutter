import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuView extends StatelessWidget {
  final String text;
  final AssetGenImage iconData;
  final Color? iconColor;

  //to adjust size icon because icon PNG by design download size not equal
  final double? iconWidth;
  final double? iconHeight;

  final VoidCallback? onPress;

  ProfileMenuView(
      {required this.text, required this.iconData, this.onPress, this.iconWidth, this.iconHeight, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
        child: Row(
          children: [
            iconData.image(
                width: iconWidth ?? 19.h, height: iconHeight ?? 19.h, fit: BoxFit.fitHeight, color: iconColor),
            SizedBox(width: 15.w),
            Text(text, style: styleTextBlack()),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20.h, color: colorGrey)
          ],
        ),
      ),
    );
  }
}
