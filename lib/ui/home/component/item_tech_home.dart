import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';

class ItemTechHome extends StatelessWidget {
  final NewObject tech;

  ItemTechHome(this.tech);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: tech);
          },
          child: Container(
            width: 250.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoadingImage(
                  imageUrl: tech.image_url ?? '',
                  borderRadius: 10.r,
                  height: 130.h,
                  width: 250.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                Text(
                  tech.name ?? 'Không có tên',
                  style: styleTextBlack(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 15.w)
      ],
    );
  }
}

class ShimmerTechHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: colorShimmerBase,
      highlightColor: colorShimmerHighLight,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerShape(height: 130.h, width: 250.h, roundRadius: 10.r),
              SizedBox(height: 10.h),
              ShimmerShape(width: 150.w, roundRadius: 5.r),
            ],
          ),
          SizedBox(width: 15.w)
        ],
      ),
    );
  }
}
