import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_webview.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/quantity_input.dart';
import 'package:flutter_lehoang_extracare/ui/gift/detail/dialog_confirm_gift.dart';
import 'package:flutter_lehoang_extracare/ui/gift/detail/gift_detail_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';

class GiftDetailPage extends StatefulWidget {
  @override
  _GiftDetailPageState createState() => _GiftDetailPageState();
}

class _GiftDetailPageState extends State<GiftDetailPage> with BaseWebView {
  Gift? _gift;

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value != null) _gift = value as Gift;

    return Scaffold(
      body: BaseContainer(
        provider: giftDetailViewModel,
        child: Container(
            color: colorBackgroundDefault,
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CommonTopbar('Quà tặng'),
                      _buildImageNameView(),
                      SizedBox(height: 15.h),
                      _buildDescriptionView()
                    ],
                  ),
                ),
                Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomButton()),
              ],
            )),
      ),
    );
  }

  Widget _buildImageNameView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ShimmerLoadingImage(
            imageUrl: _gift?.image_url ?? '',
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Divider(color: colorGrey),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h, top: 10.h),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_gift?.name ?? 'Không có tên', style: styleTextBlack(16))),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.red, size: 20.h),
                    SizedBox(width: 5.w),
                    Expanded(
                        child: Text(_gift?.point?.toString() ?? 'Không có điểm',
                            maxLines: 1, overflow: TextOverflow.ellipsis, style: styleTextRedBold()))
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    RichText(
                      maxLines: 3,
                      text: TextSpan(
                        text: 'Đã đổi: ',
                        style: styleTextBlack(),
                        children: <TextSpan>[
                          TextSpan(text: _gift?.qty_used?.toString() ?? '0', style: styleTextRed()),
                          TextSpan(text: ' | Còn lại: ', style: styleTextBlack()),
                          TextSpan(text: _gift?.qty?.toString() ?? '0', style: styleTextRed()),
                        ],
                      ),
                    ),
                    Spacer(),
                    QuantityInput(
                      min: 1,
                      max: 100,
                      step: 1,
                      value: 1,
                      textStyle: styleTextRed(),
                      iconSize: 20.h,
                      addIcon: const Icon(Icons.add_circle_outline),
                      subtractIcon: const Icon(Icons.remove_circle_outline),
                      iconActiveColor: colorPrimaryLight,
                      iconDisabledColor: Colors.grey,
                      onChanged: (val) {
                        context.read(giftDetailViewModel).quantity = (val as int);
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDescriptionView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h, top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mô tả: ', style: styleTextBlackBold()),
          SizedBox(height: 7.h),
          Divider(color: colorGrey),
          SizedBox(height: 7.h),
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 250.h),
              child : buildWebView(htmlStr: _gift?.description)
          )
          // Html(
          //   style: {
          //     "body": Style(
          //         // fontSize: FontSize(18.0),
          //         // fontWeight: FontWeight.bold,
          //         color: Colors.black),
          //   },
          //   shrinkWrap: true,
          //   data: _gift?.description ?? '',
          // ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 13.h, top: 13.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: Material(
          color: colorPrimary,
          child: InkWell(
            onTap: _exchangeGift,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 12.h, top: 12.h),
              child: Row(
                children: [
                  // Assets.images.icGift.image(height: 20.h, width: 20.h),
                  Icon(Icons.card_giftcard, size: 25.h, color: Colors.white),
                  Expanded(
                      child: Text(
                    'Đổi thưởng',
                    style: styleTextWhiteBold(),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _exchangeGift() {
    final isLogged = context.read(prefsProvider).getUser() != null;
    if (!isLogged) {
      showToast(context: context, message: "Bạn phải đăng nhập để sử dụng tính năng này");
      Navigator.of(context, rootNavigator: true)
          .pushNamedAndRemoveUntil(Constants.pageLogin, (route) => false);
      return;
    }

    final viewModel = context.read(giftDetailViewModel);
    final quantity = viewModel.quantity;

    showDialog(context: context, builder: (context) => DialogConfirmGift(_gift, quantity)).then((value) {
      if (value == true) {
        viewModel.doWithLoading(viewModel.exchangeGift(_gift?.id)).then((value) {
          viewModel.reloadUserNewPoint();
          if (value == true) {
            showSuccessToast(context: context, message: 'Đổi quà thành công');

            // Navigator.of(context, rootNavigator: true).popUntil((route) => route.settings.name == Constants.pageMaster);
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        });
      }
    });
  }
}
