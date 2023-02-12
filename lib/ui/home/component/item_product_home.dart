import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';

class ItemProductHome extends StatelessWidget {
  final Product product;

  ItemProductHome(this.product);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Constants.pageProductDetail, arguments: product);
          },
          child: Container(
            decoration: decorOnlyBorder(color: colorGrey, radius: 15.r),
            width: 200.h,
            height: 210.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
                  child: ShimmerLoadingImage(
                    imageUrl: product.image_url ?? '',
                    height: 150.w,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Divider(height: 1.h, color: colorGrey),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Text(
                    product.name ?? 'Không có tên',
                    style: styleTextBlack(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 5.h),
                // Padding(
                //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
                //   child: Text(
                //     product.short_body ?? '',
                //     style: styleTextGrey(),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 2,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        SizedBox(width: 15.w)
      ],
    );
  }
}

class ShimmerProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: colorShimmerBase,
      highlightColor: colorShimmerHighLight,
      child: Row(
        children: [
          Container(
            decoration: decorOnlyBorder(color: colorGrey, radius: 15.r),
            width: 200.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
                    child: Container(
                      height: 150.h,
                      width: double.infinity,
                      color: colorShimmerBase,
                    )),
                SizedBox(height: 10.h),
                Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: ShimmerShape(width: 100.w, roundRadius: 5.r)),
                SizedBox(height: 10.h),
                Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: ShimmerShape(width: 150.w, height: 15.h, roundRadius: 5.r)),
                SizedBox(height: 5.h),
                Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: ShimmerShape(width: 150.w, height: 15.h, roundRadius: 5.r)),
              ],
            ),
          ),
          SizedBox(width: 15.w)
        ],
      ),
    );
  }
}
