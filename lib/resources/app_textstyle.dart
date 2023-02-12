import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/gen/fonts.gen.dart';

import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle styleTextTitleWhite = TextStyle(
  fontFamily: FontFamily.helvetican,
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle styleTextTitlePrimary = TextStyle(
  fontFamily: FontFamily.helvetican,
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
  color: colorPrimary,
);

// ===============================  >>> PRIMARY
// ===============================  >>> PRIMARY
TextStyle styleTextPrimary([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: colorPrimary,
      fontWeight: FontWeight.normal,
    );

TextStyle styleTextPrimaryBold([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: colorPrimary,
      fontWeight: FontWeight.bold,
    );

// ===============================  >>> WHITE
TextStyle styleTextWhite([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );

TextStyle styleTextWhiteBold([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

// ===============================  >>> GREY
TextStyle styleTextGrey([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: colorGrey,
      fontWeight: FontWeight.normal,
    );

TextStyle styleTextGreyBold([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: colorGrey,
      fontWeight: FontWeight.bold,
    );

// ===============================  >>> GREY
TextStyle styleTextGreyDark([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: colorTextGreyDark,
      fontWeight: FontWeight.normal,
    );

TextStyle styleTextGreyDarkBold([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: colorTextGreyDark,
      fontWeight: FontWeight.bold,
    );

// ===============================  >>> Black
TextStyle styleTextBlack([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    );

TextStyle styleTextBlackBold([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

// ===============================  >>> Red
TextStyle styleTextRed([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.red,
      fontWeight: FontWeight.normal,
    );

TextStyle styleTextRedBold([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.red,
      fontWeight: FontWeight.bold,
    );

TextStyle styleTextBlue([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.blueAccent,
      fontWeight: FontWeight.normal,
    );

TextStyle styleTextBlueBold([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.blueAccent,
      fontWeight: FontWeight.bold,
    );

TextStyle styleTextLink([double? size]) => TextStyle(
      fontFamily: FontFamily.helvetican,
      fontSize: size != null ? size.sp : 15.sp,
      color: Colors.blueAccent,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.normal,
    );

TextStyle styleHintText = TextStyle(
  fontFamily: FontFamily.helvetican,
  color: colorTextHint,
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
);

TextStyle styleInputText = TextStyle(
  fontFamily: FontFamily.helvetican,
  fontWeight: FontWeight.normal,
  color: Colors.black,
  fontSize: 15.sp,
);
