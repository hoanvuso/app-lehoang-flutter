import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/list_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/gift/gift_list_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_notification.dart';
import 'notification_view_model.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  GlobalKey key1 = GlobalKey<ListViewLoadMoreState>();
  GlobalKey key2 = GlobalKey<ListViewLoadMoreState>();
  GlobalKey key3 = GlobalKey<ListViewLoadMoreState>();
  GlobalKey key4 = GlobalKey<ListViewLoadMoreState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        provider: notificationViewModel,
        child: Container(
          color: colorBackgroundDefault,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              _buildTopView(),
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
        CommonTopbar('Th??ng b??o'),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          height: 55.h,
          child: HookBuilder(builder: (_) {
            final selectedTabIndex = useProvider(notificationViewModel.select((value) => value.selectedTabIndex));
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                bool isSelected = selectedTabIndex == index;
                String text = '';
                switch (index) {
                  case 0:
                    text = 'T???t c???';
                    break;
                  case 1:
                    text = 'Khuy???n m??i';
                    break;
                  case 2:
                    text = 'C??ng ngh???';
                    break;
                  case 3:
                    text = 'Ho???t ?????ng';
                    break;
                }
                return InkWell(
                  onTap: () {
                    context.read(notificationViewModel).setSelectedTab(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h, bottom: 7.h),
                    alignment: Alignment.center,
                    decoration: decorSolidRound(circularSize: 5.r, color: isSelected ? colorGrey2 : Colors.white),
                    child: Text(text, style: isSelected ? styleTextBlack(14) : styleTextGrey(14)),
                  ),
                );
              },
            );
          }),
        )
      ],
    );
  }

  Widget _buildMainView() {
    return HookBuilder(builder: (_) {
      final selectedTabIndex = useProvider(notificationViewModel.select((value) => value.selectedTabIndex));
      switch (selectedTabIndex) {
        case 0:
          return _buildAllTabView();
        case 1:
          return _buildPromotionTabView();
        case 2:
          return _buildTechTabView();
        case 3:
          return _buildActivityTabView();
        default:
          return SizedBox();
      }
    });
  }

  Widget _buildAllTabView() {
    return ListViewLoadMore<NewObject>(
      key: key3,
      childView: (p) => ItemNotification(p),
      childViewShimmer: ShimmerNotification(),
      loadData: (page) {
        return context.read(notificationViewModel).loadNews(page);
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: news);
      },
    );
  }

  Widget _buildPromotionTabView() {
    return ListViewLoadMore<NewObject>(
      key: key1,
      childView: (p) => ItemNotification(p),
      childViewShimmer: ShimmerNotification(),
      loadData: (page) {
        return context.read(notificationViewModel).loadNews(page, Constants.NEW_TYPE_PROMOTION);
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: news);
      },
    );
  }

  Widget _buildTechTabView() {
    return ListViewLoadMore<NewObject>(
      key: key2,
      childView: (p) => ItemNotification(p),
      childViewShimmer: ShimmerNotification(),
      loadData: (page) {
        return context.read(notificationViewModel).loadNews(page, Constants.NEW_TYPE_TECH);
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: news);
      },
    );
  }

  Widget _buildActivityTabView() {
    return ListViewLoadMore<NewObject>(
      key: key4,
      childView: (p) => ItemNotification(p),
      childViewShimmer: ShimmerNotification(),
      loadData: (page) {
        return context.read(notificationViewModel).loadNews(page, Constants.NEW_TYPE_DEFAULT);
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNotificationAdminDetail, arguments: news.id);
      },
    );
  }
}
