import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SupportSolutionMenuView extends StatelessWidget {
  final String text;

  final VoidCallback? onPress;

  SupportSolutionMenuView(this.text, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
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
