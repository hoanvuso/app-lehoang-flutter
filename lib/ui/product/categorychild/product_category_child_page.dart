import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_search_input.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_title_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/grid_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/product/category/item_product_category.dart';
import 'package:flutter_lehoang_extracare/ui/product/category/product_category_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/product/categorychild/product_category_child_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/product/list/product_list_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductCategoryChildPage extends StatefulWidget {
  @override
  _ProductCategoryChildPageState createState() => _ProductCategoryChildPageState();
}

class _ProductCategoryChildPageState extends State<ProductCategoryChildPage> {
  GlobalKey<GridViewLoadMoreState> listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments;
    if (argument != null) {
      final viewModel = context.read(productCategoryChildViewModel);
      final argumentProductListPage = argument as ArgumentProductCategoryChildPage;
      viewModel.categoryParent = argumentProductListPage.categoryParent;
      viewModel.productCompany = argumentProductListPage.productCompany;
    }

    return BaseContainer(
      provider: productCategoryChildViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: Column(
          children: [
            _buildTopView(),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopView() {
    final viewModel = context.read(productCategoryChildViewModel);

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
                    final viewModel = context.read(productCategoryChildViewModel);
                    viewModel.textSearch = s;
                    listKey.currentState?.refreshData();
                  },
                  onSearchDebounce: (s) {
                    if (s.isEmpty) {
                      final viewModel = context.read(productCategoryChildViewModel);
                      viewModel.textSearch = null;
                      listKey.currentState?.refreshData();
                    }
                  },
                ),
                SizedBox(height: 15.h),
                Text(
                  '${viewModel.productCompany?.name ?? 'Thương hiệu'} > ${viewModel.categoryParent?.name ?? 'Danh mục'}',
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
        final viewModel = context.read(productCategoryChildViewModel);
        Navigator.pushNamed(context, Constants.pageProductList,
            arguments: ArgumentProductListPage(
              productCompany: viewModel.productCompany,
              categoryParent: viewModel.categoryParent,
              categoryChild: category,
            ));
      },
    );
  }

  Future<List<ProductCategory>?> loadData(int currentPage) =>
      context.read(productCategoryChildViewModel).loadProductCategories(currentPage);
}

class ArgumentProductCategoryChildPage {
  ProductCategory? categoryParent;
  ProductCompany? productCompany;

  ArgumentProductCategoryChildPage({this.categoryParent, this.productCompany});
}
