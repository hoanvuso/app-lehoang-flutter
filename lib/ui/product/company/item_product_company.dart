import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ItemProductCompany extends StatelessWidget {
  final ProductCompany productCompany;

  ItemProductCompany(this.productCompany);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: colorDividerLight),
          right: BorderSide(width: 1, color: colorDividerLight),
        ),
      ),
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h, bottom: 7.h),
      width: 0.3.sw,
      height: 100.h,
      child: ShimmerLoadingImage(imageUrl: productCompany.image_url ?? '', height: 100.h, width: double.infinity, fit: BoxFit.contain),
    );
  }
}

class ShimmerProductCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: colorShimmerBase,
      highlightColor: colorShimmerHighLight,
      child: Row(
        children: [
          _buildItemShimmer(),
          _buildItemShimmer(),
          _buildItemShimmer(),
        ],
      ),
    );
  }

  Widget _buildItemShimmer() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: colorDividerLight),
          right: BorderSide(width: 1, color: colorDividerLight),
        ),
      ),
      padding: EdgeInsets.all(5.h),
      width: 0.33.sw,
      child: ShimmerShape(height: 85.h, width: double.infinity, roundRadius: 0.r),
    );
  }
}
