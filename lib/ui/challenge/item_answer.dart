import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/question/answer.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemAnswer extends StatelessWidget {
  Answer? answer;
  int? selectedAnswerId;

  ItemAnswer({this.answer, this.selectedAnswerId});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorOnlyBorder(color: selectedAnswerId == answer?.id ? colorPrimary : colorGrey2),
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              width: 20.h,
              height: 20.h,
              decoration: decorOnlyBorder(
                color: selectedAnswerId == answer?.id ? colorPrimary : colorGrey2,
                width: selectedAnswerId == answer?.id ? 5 : 1,
              ),
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(child: Text(answer?.body ?? '', style: styleTextBlack()))
        ],
      ),
    );
  }
}
