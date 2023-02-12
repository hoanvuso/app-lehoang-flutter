import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/shimmer/shimmer_shape.dart';
import 'package:flutter_lehoang_extracare/ui/product/list/product_list_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ItemProduct extends StatelessWidget {
  final Product product;

  ItemProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: decorSolidBorder(colorBorder: colorGrey, colorSolid: Colors.white, radius: 5.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r), topRight: Radius.circular(5.r)),
                child: ShimmerLoadingImage(
                    backgroundColor: Colors.white,
                    imageUrl: product.image_url ?? '',
                    height: 150.w,
                    width: double.infinity,
                    fit: BoxFit.contain),
              ),
              Divider(height: 1.h, color: colorGrey),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(
                  product.name ?? 'Không có tên',
                  style: styleTextBlack(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
              // SizedBox(height: 5.h),
            ],
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.h,
          child: _buildSelectCompareIconButton(context),
        ),
      ],
    );
  }

  Widget _buildSelectCompareIconButton(BuildContext context) {
    return HookBuilder(builder: (_) {
      final isCompare = useProvider(productListViewModel.select((value) => value.isCompare));
      final list = useProvider(productListViewModel.select((value) => value.productCompareList));
      var checkProduct = list?.firstWhere((p) => p.id == product.id, orElse: () => Product());
      bool isSelected = checkProduct?.id != null;

      return Visibility(
        visible: isCompare,
        child: InkWell(
          onTap: () {
            if ((list?.length ?? 0) >= 10 && !isSelected) {
              showToast(context: context, message: 'Chỉ được chọn tối đa 10 sản phẩm');
              return;
            }
            context.read(productListViewModel).toggleProductCompare(product);
          },
          child: ClipOval(
            child: Container(
              padding: EdgeInsets.all(2.h),
              color: isSelected ? colorPrimary : colorGrey,
              child: Icon(Icons.done, color: Colors.white),
            ),
          ),
        ),
      );
    });
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
