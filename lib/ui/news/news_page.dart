import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/list_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/news/item_news.dart';
import 'package:flutter_lehoang_extracare/ui/news/news_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Tạm thời k dùng đến
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  GlobalKey key1 = GlobalKey<ListViewLoadMoreState>();
  GlobalKey key2 = GlobalKey<ListViewLoadMoreState>();
  GlobalKey key3 = GlobalKey<ListViewLoadMoreState>();

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value != null) {
      context.read(newsViewModel).setSelectedTab(value as int);
    }

    return BaseContainer(
      provider: newsViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: Column(
          children: [
            _buildTopView(),
            SizedBox(height: 10.h),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopView() {
    return Column(
      children: [
        CommonTopbar('Tin tức'),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          height: 55.h,
          child: HookBuilder(builder: (_) {
            final selectedTabIndex = useProvider(newsViewModel.select((value) => value.selectedTabIndex));
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                bool isSelected = selectedTabIndex == index;
                String text = '';
                switch (index) {
                  case 0:
                    text = 'Khuyến mãi';
                    break;
                  case 1:
                    text = 'Công nghệ';
                    break;
                  case 2:
                    text = 'Hoạt động';
                    break;
                }
                return InkWell(
                  onTap: () {
                    context.read(newsViewModel).setSelectedTab(index);
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
      final selectedTabIndex = useProvider(newsViewModel.select((value) => value.selectedTabIndex));
      switch (selectedTabIndex) {
        case 0:
          return _buildPromotionTabView();
        case 1:
          return _buildTechTabView();
        case 2:
          return _buildActivityTabView();
        default:
          return SizedBox();
      }
    });
  }

  Widget _buildPromotionTabView() {
    return ListViewLoadMore<NewObject>(
      key: key1,
      childView: (p) => ItemNews(p),
      childViewShimmer: ShimmerNews(),
      loadData: (page) {
        return context.read(newsViewModel).loadNews(page, 'promotion');
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: news);
      },
    );
  }

  Widget _buildTechTabView() {
    return ListViewLoadMore<NewObject>(
      key: key2,
      childView: (p) => ItemNews(p),
      childViewShimmer: ShimmerNews(),
      loadData: (page) {
        return context.read(newsViewModel).loadNews(page, 'tech');
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: news);
      },
    );
  }

  Widget _buildActivityTabView() {
    return ListViewLoadMore<NewObject>(
      key: key3,
      childView: (p) => ItemNews(p),
      childViewShimmer: ShimmerNews(),
      loadData: (page) {
        return context.read(newsViewModel).loadNews(page, 'active');
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: news);
      },
    );
  }
}
