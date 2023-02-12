import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ItemGift extends StatelessWidget {
  final Gift gift;

  ItemGift(this.gift);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorSolidBorder(colorSolid: Colors.white, colorBorder: colorGrey, radius: 15.r),
      width: 0.45.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
            child: Stack(
              children: [
                ShimmerLoadingImage(imageUrl: gift.image_url ?? '', height: 150.w, width: double.infinity),
                Positioned(bottom: 10.h, right: 10.w, child: Assets.images.icGift.image(width: 30.h, height: 30.h))
              ],
            ),
          ),
          Divider(height: 1.h, color: colorGrey),
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(gift.name ?? 'Không có tên',
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: styleTextBlack()),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.red, size: 20.h),
                    SizedBox(width: 5.w),
                    Expanded(
                        child: Text(gift.point?.toString() ?? 'Không có điểm',
                            maxLines: 1, overflow: TextOverflow.ellipsis, style: styleTextRedBold()))
                  ],
                ),
                SizedBox(height: 7.h),
                RichText(
                  text: TextSpan(
                    text: 'Đã đổi: ',
                    style: styleTextBlack(),
                    children: <TextSpan>[
                      TextSpan(text: gift.qty_used?.toString() ?? '0', style: styleTextRed()),
                      TextSpan(text: ' | Còn lại: ', style: styleTextBlack()),
                      TextSpan(text: gift.qty?.toString() ?? '0', style: styleTextRed()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerGift extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: colorShimmerBase,
      highlightColor: colorShimmerHighLight,
      child: Row(
        children: [
          _buildItemShimmer(),
          SizedBox(width: 15.w),
          _buildItemShimmer(),
        ],
      ),
    );
  }

  Widget _buildItemShimmer() {
    return Container(
        decoration: decorOnlyBorder(color: colorGrey, radius: 5.r),
        padding: EdgeInsets.all(5.h),
        width: 0.44.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerShape(height: 150.h, width: double.infinity, roundRadius: 5.r),
            Divider(height: 1.h, color: colorGrey),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: ShimmerShape(width: 100.w),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: ShimmerShape(width: 130.w),
            ),
            SizedBox(height: 5.h),
          ],
        ));
  }
}
