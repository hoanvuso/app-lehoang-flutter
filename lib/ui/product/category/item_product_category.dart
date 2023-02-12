import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ItemProductCategory extends StatelessWidget {
  final ProductCategory productCategory;

  ItemProductCategory(this.productCategory);

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
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      width: 0.3.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerLoadingImage(
            backgroundColor: Colors.green,
              imageUrl: productCategory.image_url ?? '', height: 100.w, width: double.infinity, fit: BoxFit.cover),
          SizedBox(height: 10.h),
          Text(productCategory.name ?? 'Không có tên',
              style: styleTextBlack(), maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class ShimmerProductCategory extends StatelessWidget {
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
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      width: 0.33.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerShape(height: 100.h, width: double.infinity, roundRadius: 0.r),
          SizedBox(height: 10.h),
          ShimmerShape(width: 100.w),
        ],
      ),
    );
  }
}
