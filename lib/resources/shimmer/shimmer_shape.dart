import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class ShimmerShape extends StatelessWidget {
  final height;
  final width;
  final margin;
  final roundRadius;

  ShimmerShape({this.height, this.width, this.margin, this.roundRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 20.h,
      width: width ?? 260.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(roundRadius ?? 20.r)),
        color: colorShimmerBase,
      ),
    );
  }
}
