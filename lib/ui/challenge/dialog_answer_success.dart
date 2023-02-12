import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/question/response_answer.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class DialogAnswerSuccess extends StatelessWidget {
  final ResponseAnswer responseAnswer;

  DialogAnswerSuccess(this.responseAnswer);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
          decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
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
              _buildMainView(context),
            ],
          )),
    );
  }

  Widget _buildMainView(BuildContext context) {
    if ((responseAnswer.point ?? 0) <= 0) {
      return _buildNotCorrectAnswerView(context);
    } else {
      return _buildCorrectAnswerView(context);
    }
  }

  Widget _buildCorrectAnswerView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Bạn đã trả lời chính xác ${responseAnswer.numberCorrect} câu hỏi\nTổng điểm bạn đạt được là:',
            style: styleTextBlack()),
        SizedBox(height: 10.h),
        Text('${responseAnswer.point.toString()} điểm', style: styleTextPrimaryBold(16)),
        SizedBox(height: 20.h),
        ButtonSolid(
          width: 120.w,
          text: 'Đồng ý',
          onPress: () {
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageMaster, (route) => false);
          },
          color: colorPrimary,
        )
      ],
    );
  }

  Widget _buildNotCorrectAnswerView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Rất tiếc câu trả lời không chính xác :(', style: styleTextBlack()),
        SizedBox(height: 20.h),
        ButtonSolid(
          width: 120.w,
          text: 'Đồng ý',
          onPress: () {
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageMaster, (route) => false);
          },
          color: colorPrimary,
        )
      ],
    );
  }
}
