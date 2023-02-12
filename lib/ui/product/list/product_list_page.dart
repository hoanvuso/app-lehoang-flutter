import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_search_input.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_title_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/grid_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/product/compare/product_compare_page.dart';
import 'package:flutter_lehoang_extracare/ui/product/list/item_product.dart';
import 'package:flutter_lehoang_extracare/ui/product/list/product_list_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  GlobalKey<GridViewLoadMoreState> listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments;
    if (argument != null) {
      final viewModel = context.read(productListViewModel);
      final argumentProductListPage = argument as ArgumentProductListPage;
      viewModel.categoryParent = argumentProductListPage.categoryParent;
      viewModel.categoryChild = argumentProductListPage.categoryChild;
      viewModel.productCompany = argumentProductListPage.productCompany;
    }

    return BaseContainer(
      provider: productListViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: Column(
          children: [
            _buildTopView(),
            _buildCompareButtonView(),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopView() {
    final viewModel = context.read(productListViewModel);

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
                CommonTitleTopbar('Sản phẩm'),
                SizedBox(height: 20.h),
                CommonSearchInput(
                  hint: 'Tìm sản phẩm...',
                  onSearch: (s) {
                    final viewModel = context.read(productListViewModel);
                    viewModel.textSearch = s;
                    listKey.currentState?.refreshData();
                  },
                  onSearchDebounce: (s) {
                    if (s.isEmpty) {
                      final viewModel = context.read(productListViewModel);
                      viewModel.textSearch = null;
                      listKey.currentState?.refreshData();
                    }
                  },
                ),
                SizedBox(height: 15.h),
                Text(
                    '${viewModel.productCompany?.name ?? 'Thương hiệu'} > ${viewModel.categoryParent?.name ?? 'Danh mục 1'} > ${viewModel.categoryChild?.name ?? 'Danh mục 2'}',
                    style: styleTextWhite(),
                    textAlign: TextAlign.start,
                    maxLines: 1)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCompareButtonView() {
    return HookBuilder(builder: (_) {
      final viewModel = context.read(productListViewModel);

      final isCompare = useProvider(productListViewModel.select((value) => value.isCompare));
      final productCompareList = useProvider(productListViewModel.select((value) => value.productCompareList));

      return Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            if (isCompare) {
              final productCompareList = viewModel.productCompareList;
              if ((productCompareList?.length ?? 0) < 2) {
                showToast(context: context, message: 'Hãy chọn ít nhất 2 sản phẩm');
                return;
              }
              final argument = ArgumentProductComparePage(
                  productList: productCompareList, categoryChild: context.read(productListViewModel).categoryChild);
              Navigator.pushNamed(context, Constants.pageProductCompare, arguments: argument);
            } else {
              viewModel.changeCompareStatus();
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            decoration: decorOnlyBorder(color: Colors.red, width: 1.5, radius: 7.r),
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h, bottom: 7.h),
            child: Text(
              isCompare ? 'Hoàn thành (${productCompareList?.length ?? 0}/10)' : 'So sánh sản phẩm',
              style: styleTextRed(),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildMainView() {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: GridViewLoadMore<Product>(
        key: listKey,
        childView: (p) => ItemProduct(p),
        childViewShimmer: ShimmerProduct(),
        // childAspectRatio: 11 / 15,
        childAspectRatio: 11 / 13,
        crossAxisCount: 2,
        loadData: loadData,
        onClickItem: (product) {
          Navigator.pushNamed(context, Constants.pageProductDetail, arguments: product);
        },
      ),
    );
  }

  Future<List<Product>?> loadData(int currentPage) => context.read(productListViewModel).loadProducts(currentPage);
}

class ArgumentProductListPage {
  ProductCategory? categoryParent;
  ProductCategory? categoryChild;
  ProductCompany? productCompany;

  ArgumentProductListPage({this.categoryParent, this.productCompany, this.categoryChild});
}
