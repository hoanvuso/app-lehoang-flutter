import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/grid_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/gift/gift_list_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/gift/item_gift.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GiftListPage extends StatefulWidget {
  @override
  _GiftListPageState createState() => _GiftListPageState();
}

class _GiftListPageState extends State<GiftListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        provider: giftListViewModel,
        child: Container(
          color: colorBackgroundDefault,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              CommonTopbar('Danh sách quà'),
              Expanded(child: _buildMainView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      child: GridViewLoadMore<Gift>(
        childView: (p) => ItemGift(p),
        childViewShimmer: ShimmerGift(),
        childAspectRatio: 10 / 15,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.h,
        crossAxisCount: 2,
        loadData: loadData,
        onClickItem: (gift) {
          Navigator.pushNamed(context, Constants.pageGiftDetail, arguments: gift);
        },
      ),
    );
  }

  Future<List<Gift>?> loadData(int currentPage) => context.read(giftListViewModel).loadGiftHistory(currentPage);
}
