import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/container_shimmer_loading.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_lehoang_extracare/utils/util/time_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ItemNotification extends StatelessWidget {
  final newObject;

  ItemNotification(this.newObject);

  @override
  Widget build(BuildContext context) {
    var dateTimeShow = 'Không có ngày';
    try {
      final dateTime = DateFormat(DATE_FORMAT_3).parse(newObject.created_at!);
      dateTimeShow = DateFormat(DATE_FORMAT_4).format(dateTime);
    } catch (e) {}

    return Container(
        color: newObject.was_read_count == 0 ? colorGrey2 : Colors.white,
        padding: EdgeInsets.only(left: 10.w, right: 20.w, top: 15.h, bottom: 15.h),
        child: Row(
          children: [
            Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: newObject.was_read_count == 0,
                child: Icon(Icons.circle, color: Colors.red, size: 10.h)),
            SizedBox(width: 5.w),
            ShimmerLoadingImage(imageUrl: newObject.image_url ?? '', height: 60.h, width: 60.h, fit: BoxFit.cover),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newObject.name ?? 'Không có tên',
                    style: styleTextBlack(),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    dateTimeShow,
                    style: styleTextGrey(13),
                  ),
                  SizedBox(height: 10.h),
                  Container(color: colorGrey, height: 1, width: double.infinity)
                ],
              ),
            )
          ],
        ));
  }
}

class ShimmerNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(milliseconds: 1000),
        baseColor: colorShimmerBase,
        highlightColor: colorShimmerHighLight,
        child: Container(
            padding: EdgeInsets.only(left: 10.w, right: 20.w, top: 15.h, bottom: 15.h),
            child: Row(
              children: [
                ShimmerShape(height: 60.h, width: 60.h, roundRadius: 0.r),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerShape(width: 150.w),
                      SizedBox(height: 10.h),
                      ShimmerShape(width: 60.w),
                      SizedBox(height: 10.h),
                      Container(color: colorGrey, height: 1, width: double.infinity)
                    ],
                  ),
                )
              ],
            )));
  }
}
