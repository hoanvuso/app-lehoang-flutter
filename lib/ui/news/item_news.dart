import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_lehoang_extracare/utils/util/time_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ItemNews extends StatelessWidget {
  final NewObject newObject;

  ItemNews(this.newObject);

  @override
  Widget build(BuildContext context) {
    var dateTimeShow = 'Không có ngày';
    try {
      final dateTime = DateFormat(DATE_FORMAT_3).parse(newObject.created_at!);
      dateTimeShow =  DateFormat(DATE_FORMAT_4).format(dateTime);
    } catch (e) {}

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingImage(imageUrl: newObject.image_url ?? '', height: 200.h, width: double.infinity,  fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 10.w, left: 10.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  newObject.name ?? 'Không có tên',
                  style: styleTextBlack(),
                ),
              ),
              SizedBox(width: 20.w),
              Icon(Icons.calendar_today_outlined, size: 15.h, color: colorGrey),
              SizedBox(width: 5.w),
              Text(
                dateTimeShow,
                style: styleTextGrey(13),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ShimmerNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: colorShimmerBase,
      highlightColor: colorShimmerHighLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerShape(height: 200.h, width: double.infinity, roundRadius: 0.r),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 10.w, left: 10.w),
            child: Row(
              children: [
                ShimmerShape(width: 150.w),
                Spacer(),
                Icon(Icons.calendar_today_outlined, size: 15.h, color: colorGrey),
                SizedBox(width: 5.w),
                ShimmerShape(width: 60.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
