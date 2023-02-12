import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

decorOnlySolid({Color? color, double? radius}) =>
    BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 10.r), color: color);

decorOnlyBorder({Color? color, double? radius, double? width}) => BoxDecoration(
    border: Border.all(color: color ?? colorGrey, width: width ?? 1),
    borderRadius: BorderRadius.circular(radius ?? 10.r));

decorSolidBorder({Color? colorBorder, Color? colorSolid, double? radius, double? borderWidth}) => BoxDecoration(
    border: Border.all(color: colorBorder ?? colorGrey, width: borderWidth ?? 1),
    borderRadius: BorderRadius.circular(radius ?? 10.r),
    color: colorSolid);

decorSolidRound({bool? isShadow, required double circularSize, Color? color}) => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(circularSize)),
      boxShadow: (isShadow != true)
          ? null
          : [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2.r,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              )
            ],
    );

// final decorBottomBorderGrey = const BoxDecoration(
//   border: Border(
//     bottom: BorderSide(width: 1, color: colorGrey),
//   ),
// );
