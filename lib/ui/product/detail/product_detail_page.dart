import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/product/product.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_webview.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/ui/product/detail/product_detail_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/currency_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatefulWidget {

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> with BaseWebView {
  Product? _product;

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value != null) _product = value as Product;
    // _product = _product?.copyWith(price: 100000);

    return BaseContainer(
      provider: productDetailViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopView(),
              SizedBox(height: 15.h),
              _buildDescriptionView(),
              SizedBox(height: 15.h),
              _buildSpecificationView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 25.h, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25.h,
            height: 25.h,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 2.0,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.h,
                color: Colors.black,
              ),
              shape: const CircleBorder(),
            ),
          ),
          SizedBox(height: 20.h),
          ShimmerLoadingImage(
            width: double.infinity,
            height: 200.h,
            imageUrl: _product?.image_url,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('${_product?.model ?? 'Không có Model'}',
                        style: styleTextBlackBold(), textAlign: TextAlign.start),
                    SizedBox(height: 5.h),
                    Text('${_product?.name ?? 'Không có tên'}', style: styleTextBlack(), textAlign: TextAlign.start),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              _product?.price == null
                  ? SizedBox()
                  : Text('${getCurrencyFullShow(_product?.price)} đ', style: styleTextRedBold()),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDescriptionView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mô tả', style: styleTextBlackBold(), textAlign: TextAlign.start),
          SizedBox(height: 5.h),
          Divider(color: colorGrey),
          SizedBox(height: 5.h),
          Text(_product?.description ?? "", style: styleTextBlack(), textAlign: TextAlign.start),
          // Text('${_product?.description ?? ''}', style: styleTextBlack(), textAlign: TextAlign.start),
        ],
      ),
    );
  }

  Widget _buildDescriptionView2() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mô tả', style: styleTextBlackBold(), textAlign: TextAlign.start),
          SizedBox(height: 5.h),
          Divider(color: colorGrey),
          SizedBox(height: 5.h),
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 250.h), child: buildWebView(htmlStr: _product?.description))
          // Text('${_product?.description ?? ''}', style: styleTextBlack(), textAlign: TextAlign.start),
        ],
      ),
    );
  }

  Widget _buildSpecificationView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('THÔNG SỐ KỸ THUẬT:', style: styleTextBlackBold(), textAlign: TextAlign.start),
          SizedBox(height: 5.h),
          Divider(color: colorGrey),
          SizedBox(height: 5.h),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _product?.tech_infomations?.length ?? 0,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final techInfo = _product?.tech_infomations?[index];
                return Text('${techInfo?.feature?.name} : ${techInfo?.value ?? ''}',
                    style: styleTextBlack(), textAlign: TextAlign.start);
              }),
          // ConstrainedBox(
          //   constraints: BoxConstraints(maxHeight: 300.h),
          //   child: Html(
          //     style: {
          //       "body": Style(
          //         // fontSize: FontSize(18.0),
          //         // fontWeight: FontWeight.bold,
          //           color: Colors.black),
          //     },
          //     shrinkWrap: true,
          //     data: _product?.description ?? '',
          //   ),
          // )
          // Text('${_product?.specifications ?? 'Không có thông số'}',
          //     style: styleTextBlack(), textAlign: TextAlign.start),
        ],
      ),
    );
  }
}
