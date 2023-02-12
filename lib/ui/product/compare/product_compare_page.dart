import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_category_feature.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product_tech_information.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/ui/product/compare/product_compare_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductComparePage extends StatefulWidget {
  @override
  _ProductComparePageState createState() => _ProductComparePageState();
}

class _ProductComparePageState extends State<ProductComparePage> {
  // List<Product>? _productList;

  @override
  void initState() {
    super.initState();
    // final argument = ModalRoute.of(context)?.settings.arguments;
    // if (argument != null) {
    //   final viewModel = context.read(productCompareViewModel);
    //   final argumentProductListPage = argument as ArgumentProductComparePage;
    //   viewModel.productList = argumentProductListPage.productList;
    //   viewModel.categoryChild = argumentProductListPage.categoryChild;
    //   viewModel.loadProductCategoryFeature();
    // }

    // final viewModel = context.read(productCompareViewModel);
    // viewModel.loadProductCategoryFeature();
  }

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments;
    if (argument != null) {
      final viewModel = context.read(productCompareViewModel);
      final argumentProductListPage = argument as ArgumentProductComparePage;
      viewModel.productList = argumentProductListPage.productList;
      viewModel.categoryChild = argumentProductListPage.categoryChild;
      viewModel.loadProductCategoryFeature();
    }

    return BaseContainer(
      provider: productCompareViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonTopbar('So sánh'),
              _buildMainView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return HookBuilder(builder: (_) {
      final featureList = useProvider(productCompareViewModel.select((value) => value.featureList));
      final productList = useProvider(productCompareViewModel.select((value) => value.productList));

      return SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildFeatureColumn(featureList),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildProductInfoColumn(featureList, productList),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  List<Widget> _buildFeatureColumn(List<ProductCategoryFeature>? list) {
    return List.generate(
        (list?.length ?? 0) + 1,
        (index) => Container(
              alignment: Alignment.center,
              width: 110.w,
              height: 100.h,
              color: Colors.white,
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
              margin: EdgeInsets.all(2.0),
              child: Center(
                child: Text(
                  index == 0 ? 'Hình ảnh' : list?[index - 1].name ?? '',
                  style: styleTextBlackBold(),
                  textAlign: TextAlign.center,
                ),
              ),
            ));
  }

  List<Widget> _buildProductInfoColumn(List<ProductCategoryFeature>? featureList, List<Product>? productList) {
    return List.generate((featureList?.length ?? 0) + 1, (index) {
      return Row(
        children: [
          for (var i = 0; i < (productList?.length ?? 0); i++)
            if (index == 0)
              _cellImage(productList?[i].image_url)
            else
              _cell(getFeatureFromProduct(featureList?[index - 1].id, productList?[i])),
        ],
      );
    });
  }

  String getFeatureFromProduct(int? featureId, Product? product) {
    if (featureId == null || product == null) return '';
    List<ProductTechInformation>? techInfoList = product.tech_infomations;
    ProductTechInformation? techInfo = techInfoList?.firstWhere((tech) => tech.feature_id == featureId.toString(),
        orElse: () => ProductTechInformation());
    return techInfo?.value ?? '';
  }

  Widget _cellImage(String? url) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      width: 180.w,
      height: 100.h,
      color: Colors.white,
      margin: EdgeInsets.all(2.0),
      child: Center(child: ShimmerLoadingImage(imageUrl: url, height: 80.h, width: 150.w, fit: BoxFit.contain)),
    );
  }

  Widget _cell(String? text) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      width: 180.w,
      height: 100.h,
      color: Colors.white,
      margin: EdgeInsets.all(2.0),
      child: Center(child: Text(text ?? '', style: styleTextBlack())),
    );
  }
}

class ArgumentProductComparePage {
  ProductCategory? categoryChild;
  List<Product>? productList;

  ArgumentProductComparePage({this.categoryChild, this.productList});
}
