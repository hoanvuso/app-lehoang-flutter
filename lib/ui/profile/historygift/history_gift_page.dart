import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_gift.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/date_picker_normal.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/list_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/profile/historygift/history_gift_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/profile/historygift/item_history_gift.dart';
import 'package:flutter_lehoang_extracare/utils/util/time_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HistoryGiftPage extends StatefulWidget {
  @override
  _HistoryGiftPageState createState() => _HistoryGiftPageState();
}

class _HistoryGiftPageState extends State<HistoryGiftPage> {
  GlobalKey<ListViewLoadMoreState> listViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        provider: historyGiftViewModel,
        child: Container(
          color: colorBackgroundDefault,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              _buildTopView(),
              _buildFilterView(),
              Expanded(child: _buildMainView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopView() {
    return Column(
      children: [
        CommonTopbar('Lịch sử đăng ký serial & đổi quà tặng'),
        Material(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              height: 55.h,
              child: Row(
                children: [
                  Expanded(
                    child: HookBuilder(builder: (_) {
                      final selectedTabIndex =
                          useProvider(historyGiftViewModel.select((value) => value.selectedTabIndex));
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedTabIndex == index;
                          String text = '';
                          switch (index) {
                            case 0:
                              text = 'Lịch sử đổi quà';
                              break;
                            case 1:
                              text = 'Lịch sử đăng kí serial';
                              break;
                          }
                          return Container(
                            margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
                            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h, bottom: 7.h),
                            alignment: Alignment.center,
                            decoration:
                                decorSolidRound(circularSize: 5.r, color: isSelected ? colorGrey2 : Colors.white),
                            child: InkWell(
                                onTap: () {
                                  context.read(historyGiftViewModel).setSelectedTab(index);
                                },
                                child: Text(text, style: isSelected ? styleTextBlack(14) : styleTextGrey(14))),
                          );
                        },
                      );
                    }),
                  ),
                  SizedBox(width: 7.w),
                  Container(width: 1.w, color: colorGrey, height: 25.h),
                  SizedBox(width: 7.w),
                  InkWell(
                    child: Row(
                      children: [
                        Text('Lọc', style: styleTextBlack()),
                        SizedBox(width: 5.w),
                        Assets.images.icFilter.image(width: 25.h, height: 25.h, color: Colors.black)
                      ],
                    ),
                    onTap: () {
                      context.read(historyGiftViewModel).toggleFilter();
                    },
                  )
                ],
              )),
        )
      ],
    );
  }

  Widget _buildFilterView() {
    return HookBuilder(builder: (_) {
      final isShow = useProvider(historyGiftViewModel.select((value) => value.isShowFilter));
      return Visibility(
        visible: isShow,
        child: Material(
          color: Colors.white,
          child: Container(
              height: 60.h,
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
              child: Column(
                children: [
                  Container(height: 1, color: colorGrey2),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Từ ngày:', style: styleTextGrey()),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: DatePickerNormal(
                            style: styleTextBlack(),
                            hintText: 'Chọn ngày',
                            textAlign: TextAlign.center,
                            borderType: BorderType.typeNone,
                            onSelectedDate: (date) {
                              final viewModel = context.read(historyGiftViewModel);
                              viewModel.startDateSearch = DateFormat(DATE_FORMAT_1).format(date);
                              listViewKey.currentState?.refreshData();
                            },
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Icon(Icons.keyboard_arrow_down_outlined, size: 20.h),
                        SizedBox(width: 20.w),
                        Text('Đến ngày:', style: styleTextGrey()),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: DatePickerNormal(
                            style: styleTextBlack(),
                            textAlign: TextAlign.center,
                            hintText: 'Chọn ngày',
                            borderType: BorderType.typeNone,
                            onSelectedDate: (date) {
                              final viewModel = context.read(historyGiftViewModel);
                              viewModel.endDateSearch = DateFormat(DATE_FORMAT_1).format(date);
                              listViewKey.currentState?.refreshData();
                            },
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Icon(Icons.keyboard_arrow_down_outlined, size: 20.h),
                      ],
                    ),
                  )
                ],
              )),
        ),
      );
    });
  }

  Widget _buildMainView() {
    return HookBuilder(builder: (_) {
      final selectedTabIndex = useProvider(historyGiftViewModel.select((value) => value.selectedTabIndex));
      switch (selectedTabIndex) {
        case 0:
          return _buildHistoryGiftTabView();
        case 1:
          return Text('Lịch sử đăng ký serial');
        default:
          return SizedBox();
      }
    });
  }

  Widget _buildHistoryGiftTabView() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
      child: ListViewLoadMore<HistoryGift>(
        key: listViewKey,
        childView: (p) => ItemHistoryGift(p),
        childViewShimmer: ShimmerHistoryGift(),
        loadData: loadData,
        onClickItem: (promotion) {},
      ),
    );
  }

  Future<List<HistoryGift>?> loadData(int currentPage) =>
      context.read(historyGiftViewModel).loadGiftHistory(currentPage);
}
