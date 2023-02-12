import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/config/common_banner.dart';
import 'package:flutter_lehoang_extracare/resources/base/container_shimmer_loading.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/utils/util/launcher_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../app_colors.dart';

class SlideBanner extends StatelessWidget {
  final List<CommonBanner>? listBanner;

  SlideBanner(this.listBanner);

  @override
  Widget build(BuildContext context) {
    return ContainerLoading(
      child: CarouselSlider(
        options: CarouselOptions(height: 190.h, autoPlay: true, autoPlayInterval: const Duration(seconds: 5)),
        items: listBanner?.map((banner) {
              return Builder(
                  builder: (_) => Container(
                      margin: EdgeInsets.only(right: 7.w, left: 7.w),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: ShimmerLoadingImage(
                              imageUrl: banner.image_url,
                              fit: BoxFit.cover,
                              backgroundColor: Colors.white,
                              width: double.infinity,
                              height: 190.h))));
            }).toList() ??
            [],
      ),
      isLoadSuccess: listBanner != null,
      loadingView: ShimmerBanner(),
    );
  }
}

class ShimmerBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: colorShimmerBase,
      highlightColor: colorShimmerHighLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  height: ScreenUtil().setHeight(190),
                  color: colorShimmerBase,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
