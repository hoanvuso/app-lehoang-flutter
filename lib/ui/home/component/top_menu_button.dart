import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMenuButton extends StatelessWidget {
  final String text;
  final AssetGenImage iconData;

  //to adjust size icon because icon PNG by design download size not equal
  final double? iconWidth;
  final double? iconHeight;

  final VoidCallback? onPress;

  TopMenuButton({required this.text, required this.iconData, this.onPress, this.iconWidth, this.iconHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Material(
            color: colorPrimaryLight,
            child: InkWell(
              onTap: onPress,
              child: Container(
                padding: EdgeInsets.all(10.h),
                child: iconData.image(width: iconWidth ?? 25.h, height: iconHeight ?? 25.h, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(text, style: styleTextWhite(), textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis)
      ],
    );
  }
}
