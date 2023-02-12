import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_back.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CommonTopBarBack extends StatelessWidget {
  final String text;

  CommonTopBarBack(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [colorPrimaryDark, colorPrimary],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.8, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Row(
          children: [
            SizedBox(width: 15.w),
            Expanded(child: Text(text, style: styleTextWhite(18), maxLines: 2, overflow: TextOverflow.ellipsis))
          ],
        ),
      ),
    );
  }
}
