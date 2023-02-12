import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/scan/response_scan.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_grey2.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class DialogScanSuccess extends StatelessWidget {
  final ResponseScan responseScan;

  DialogScanSuccess(this.responseScan);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
          decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          width: 0.5.sw,
          height: 220.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 10.0,
                  height: 20.0,
                  child: OverflowBox(
                    minWidth: 0.0,
                    maxWidth: 90.w,
                    minHeight: 0.0,
                    maxHeight: 90.w,
                    child: ClipOval(
                      child: Container(
                        color: colorGrey2,
                        width: 90.w,
                        height: 90.w,
                        child: Assets.images.icScanSuccess.image(width: 60.w, height: 60.w),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Text('Bạn đã quét mã thành công\nTổng điểm tích lũy của bạn là:',
                  style: styleTextBlack(), textAlign: TextAlign.center),
              SizedBox(height: 10.h),
              Text('${responseScan.getPoint()} điểm', style: styleTextPrimaryBold(16)),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(width: 15.w),
                  Expanded(
                      child: ButtonGrey2(
                          text: 'Thoát',
                          onPress: () {
                            Navigator.popUntil(context, (route) => route.isFirst);
                          })),
                  SizedBox(width: 15.w),
                  Expanded(
                      child: ButtonSolid(
                    text: 'Quét tiếp',
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
