import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BorderType { typeRoundBorder, typeUnderLine, typeNone }

mixin TextFieldConfig {
  static const typeUnderLine = 1;
  static const typeRoundBorder = 2;
  static const typeNone = 3;

  final focusColor = colorPrimary;
  final enableColor = colorDivider;

  InputBorder? getEnableBorder(BorderType? borderType) {
    switch (borderType) {
      case BorderType.typeRoundBorder:
        return OutlineInputBorder(
            borderSide: BorderSide(color: enableColor), borderRadius: BorderRadius.all(Radius.circular(10.r)));
      case BorderType.typeUnderLine:
        return UnderlineInputBorder(borderSide: BorderSide(color: enableColor));
      case BorderType.typeNone:
        return InputBorder.none;
      default:
        return null;
    }
  }

  InputBorder? getFocusBorder(BorderType? borderType) {
    switch (borderType) {
      case BorderType.typeRoundBorder:
        return OutlineInputBorder(
            borderSide: BorderSide(color: focusColor), borderRadius: BorderRadius.all(Radius.circular(10.r)));
      case BorderType.typeUnderLine:
        return UnderlineInputBorder(borderSide: BorderSide(color: focusColor));
      case BorderType.typeNone:
        return InputBorder.none;
      default:
        return null;
    }
  }
}
