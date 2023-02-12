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
import 'package:flutter_lehoang_extracare/ui/news/promotion/promotion_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/news/tech/tech_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TechPage extends StatefulWidget {
  @override
  _TechPageState createState() => _TechPageState();
}

class _TechPageState extends State<TechPage> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      provider: techViewModel,
      child: Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        child: Column(
          children: [
            CommonTopbar('Công nghệ'),
            SizedBox(height: 10.h),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return ListViewLoadMore<NewObject>(
      childView: (p) => ItemNews(p),
      childViewShimmer: ShimmerNews(),
      loadData: (page) {
        return context.read(techViewModel).loadTechs(page);
      },
      onClickItem: (news) {
        Navigator.pushNamed(context, Constants.pageNewsDetail, arguments: news);
      },
    );
  }
}
