import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_company.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_search_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_title_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/grid_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/product/company/item_product_company.dart';
import 'package:flutter_lehoang_extracare/ui/product/company/product_company_view_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCompanyPage extends StatefulWidget {
  @override
  _ProductCompanyPageState createState() => _ProductCompanyPageState();
}

class _ProductCompanyPageState extends State<ProductCompanyPage> {
  GlobalKey<GridViewLoadMoreState> listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      provider: productCompanyViewModel,
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
                CommonTitleTopbar('Thương hiệu'),
                SizedBox(height: 20.h),
                CommonSearchInput(
                  hint: 'Tìm sản phẩm...',
                  onSearch: (s) {
                    final viewModel = context.read(productCompanyViewModel);
                    viewModel.textSearch = s;
                    listKey.currentState?.refreshData();
                  },
                  onSearchDebounce: (s) {
                    if (s.isEmpty) {
                      final viewModel = context.read(productCompanyViewModel);
                      viewModel.textSearch = null;
                      listKey.currentState?.refreshData();
                    }
                  },
                ),
                SizedBox(height: 15.h),
                Text('Bấm vào logo để xem sản phẩm', style: styleTextWhite(), textAlign: TextAlign.start)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMainView() {
    return GridViewLoadMore<ProductCompany>(
      key: listKey,
      childView: (p) => ItemProductCompany(p),
      childViewShimmer: ShimmerProductCompany(),
      childAspectRatio: 11 / 9,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      crossAxisCount: 3,
      loadData: loadData,
      onClickItem: (company) {
        Navigator.pushNamed(context, Constants.pageProductCategory, arguments: company);
      },
    );
  }

  Future<List<ProductCompany>?> loadData(int currentPage) =>
      context.read(productCompanyViewModel).loadProductCompanies(currentPage);
}
