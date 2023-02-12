import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/scan/response_scan.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_grey2.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_lehoang_extracare/resources/component/custom/richtech_custom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class DialogScanConfirm extends StatelessWidget {
  final String code;
  final ResponseScan responseScan;

  DialogScanConfirm(this.code, this.responseScan);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
          decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
          width: 0.7.sw,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Xác nhận', style: styleTextBlackBold(18), textAlign: TextAlign.center),
              SizedBox(height: 10.h),
              Text('Bạn có chắc chắn muốn dùng mã này?', style: styleTextBlack(13), textAlign: TextAlign.center),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Assets.images.appLogo.image(width: 70.h, height: 70.h),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(code, style: styleTextRedBold()),
                      SizedBox(height: 10.h),
                      RichTextCustom(
                        children: [
                          TextSpan(text: 'Bạn được nhận: ', style: styleTextBlack()),
                          TextSpan(text: '${responseScan.getPoint()} đ', style: styleTextBlackBold()),
                        ],
                      )
                    ],
                  ))
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(width: 15.w),
                  Expanded(
                      child: ButtonGrey2(
                          text: 'Huỷ',
                          onPress: () {
                            Navigator.maybePop(context);
                          })),
                  SizedBox(width: 15.w),
                  Expanded(
                      child: ButtonSolid(
                    text: 'Xác nhận',
                    onPress: () {
                      Navigator.maybePop(context, true);
                    },
                    color: colorPrimary,
                  )),
                  SizedBox(width: 15.w),
                ],
              )
            ],
          )),
    );
  }
}
