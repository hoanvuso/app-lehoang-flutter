import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/banner/slide_banner.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_search_input.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_title_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/grid_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/product/category/item_product_category.dart';
import 'package:flutter_lehoang_extracare/ui/product/category/product_category_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/product/categorychild/product_category_child_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductCategoryPage extends StatefulWidget {
  @override
  _ProductCategoryPageState createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  GlobalKey<GridViewLoadMoreState> listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    final viewModel = context.read(productCategoryViewModel);
    viewModel.loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    final productCompany = ModalRoute.of(context)?.settings.arguments;
    if (productCompany != null)
      context.read(productCategoryViewModel).productCompany = productCompany as ProductCompany;

    return BaseContainer(
      provider: productCategoryViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: Column(
          children: [
            _buildTopView(),
            SizedBox(height: 10.h),
            HookBuilder(builder: (context) {
              final listBanner = useProvider(productCategoryViewModel.select((value) => value.listBanners));
              return SlideBanner(listBanner);
            }),
            SizedBox(height: 10.h),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopView() {
    return Container(
      height: 165.h,
      child: Stack(
        children: [
          Assets.images.backgroundHome.image(width: double.infinity, height: 165.h, fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 25.h, bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTitleTopbar('Danh mục sản phẩm'),
                SizedBox(height: 20.h),
                CommonSearchInput(
                  hint: 'Tìm sản phẩm...',
                  onSearch: (s) {
                    final viewModel = context.read(productCategoryViewModel);
                    viewModel.textSearch = s;
                    listKey.currentState?.refreshData();
                  },
                  onSearchDebounce: (s) {
                    if (s.isEmpty) {
                      final viewModel = context.read(productCategoryViewModel);
                      viewModel.textSearch = null;
                      listKey.currentState?.refreshData();
                    }
                  },
                ),
                SizedBox(height: 15.h),
                Text(
                  '${context.read(productCategoryViewModel).productCompany?.name ?? 'Thương hiệu'}',
                  style: styleTextWhite(),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMainView() {
    return GridViewLoadMore<ProductCategory>(
      key: listKey,
      childView: (category) => ItemProductCategory(category),
      childViewShimmer: ShimmerProductCategory(),
      childAspectRatio: 11 / 13,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      crossAxisCount: 3,
      loadData: loadData,
      onClickItem: (category) {
        final viewModel = context.read(productCategoryViewModel);
        Navigator.pushNamed(context, Constants.pageProductCategoryChild,
            arguments: ArgumentProductCategoryChildPage(
              productCompany: viewModel.productCompany,
              categoryParent: category,
            ));
      },
    );
  }

  Future<List<ProductCategory>?> loadData(int currentPage) =>
      context.read(productCategoryViewModel).loadProductCategories(currentPage);
}
