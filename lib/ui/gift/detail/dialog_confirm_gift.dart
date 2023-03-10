import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_grey2.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogConfirmGift extends StatelessWidget {
  Gift? _gift;
  int? _quantity;

  DialogConfirmGift(this._gift, this._quantity);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
          decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
          width: 0.5.sw,
          height: 250.h,
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
                        child: Assets.images.icGift2.image(width: 60.w, height: 60.w),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Text('X??c nh???n ?????i qu??', style: styleTextBlackBold(18)),
              SizedBox(height: 10.h),
              Text('$_quantity x ${_gift?.name ?? 'Kh??ng c?? t??n'}', style: styleTextBlack()),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.red, size: 20.h),
                  SizedBox(width: 5.w),
                  Text('${(_gift?.point ?? 0) * (_quantity ?? 0)}??',
                      maxLines: 1, overflow: TextOverflow.ellipsis, style: styleTextRedBold())
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  SizedBox(width: 15.w),
                  Expanded(
                      child: ButtonGrey2(
                          text: 'Tho??t',
                          onPress: () {
                            Navigator.maybePop(context);
                          })),
                  SizedBox(width: 15.w),
                  Expanded(
                      child: ButtonSolid(
                    text: 'X??c nh???n',
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
