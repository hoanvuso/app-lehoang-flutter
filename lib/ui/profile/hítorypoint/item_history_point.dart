import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_point.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_lehoang_extracare/utils/util/time_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ItemHistoryPoint extends StatelessWidget {
  final HistoryPoint historyPoint;

  ItemHistoryPoint(this.historyPoint);

  @override
  Widget build(BuildContext context) {
    var time = 'Không có ngày';

    try {
      time = DateFormat(DATE_FORMAT_4).format(DateTime.parse(historyPoint.created_at!));
    } catch (e) {}

    return Container(
        decoration: decorSolidRound(circularSize: 7.r, color: Colors.white),
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h, top: 10.h),
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
          children: [
            // ShimmerLoadingImage(imageUrl: '', width: 70.w, height: 70.w),
            // SizedBox(width: 10.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        historyPoint.product_name ?? 'Không có tên',
                        style: styleTextBlack(),
                      )),
                      SizedBox(width: 7.w),
                      Text('+${historyPoint.point.toString()}đ', style: styleTextRed())
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Code: ${historyPoint.code_string}', style: styleTextBlack())),
                  SizedBox(height: 5.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.images.icCalendar.image(width: 15.h, height: 15.h, color: colorGrey),
                      SizedBox(width: 7.w),
                      Text(time, style: styleTextGrey(14)),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ShimmerHistoryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorSolidRound(circularSize: 7.r, color: Colors.white),
      margin: EdgeInsets.only(bottom: 10.h),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 1000),
        baseColor: colorShimmerBase,
        highlightColor: colorShimmerHighLight,
        child: Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h, top: 10.h),
            child: Row(
              children: [
                // ShimmerShape(width: 70.w, height: 70.w),
                // SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ShimmerShape(width: 200.w),
                          Spacer(),
                          ShimmerShape(width: 50.w),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Assets.images.icCalendar.image(width: 25.h, height: 25.h, color: colorGrey),
                          SizedBox(width: 5.w),
                          ShimmerShape(width: 100.w),
                          SizedBox(width: 15.w),
                          ShimmerShape(width: 60.w),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
