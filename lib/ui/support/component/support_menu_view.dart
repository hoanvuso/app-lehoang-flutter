import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportMenuView extends StatelessWidget {
  final String text;

  final VoidCallback? onPress;

  SupportMenuView(this.text, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onPress,
        child: Container(
          decoration: decorOnlyBorder(radius: 5.r, color: colorGrey2),
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
          child: Row(
            children: [
              Expanded(child: Text(text, style: styleTextBlack())),
              Icon(Icons.arrow_forward_ios, size: 20.h, color: colorGrey)
            ],
          ),
        ),
      ),
    );
  }
}
