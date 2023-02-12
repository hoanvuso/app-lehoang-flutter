import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/list_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/support/solution/support_solution_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';
import 'component/support_solution_menu_view.dart';

class SupportSolutionPage extends StatefulWidget {
  @override
  _SupportSolutionPageState createState() => _SupportSolutionPageState();
}

class _SupportSolutionPageState extends State<SupportSolutionPage> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      provider: supportSolutionViewModel,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            CommonTopbar('Giải pháp'),
            SizedBox(height: 10.h),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: ListViewLoadMore<SupportObject>(
        childView: (supportObject) => Column(
          children: [
            SupportSolutionMenuView(supportObject.name, () {
              Navigator.pushNamed(context, Constants.pageSupportSolutionDetail, arguments: supportObject);
            }),
            Divider(color: colorGrey),
          ],
        ),
        childViewShimmer: SizedBox(),
        loadData: loadData,
        onClickItem: null,
      ),
    );

    // return Padding(
    //   padding: EdgeInsets.only(left: 15.w, right: 15.w),
    //   child: Column(
    //     children: [
    //       SupportSolutionMenuView('Hướng dẫn xóa thiết bị ra khỏi tài khoản Hik-Connect bằng App', () {}),
    //       Divider(color: colorGrey),
    //       SupportSolutionMenuView('Hướng dẫn xóa thiết bị ra khỏi tài khoản Hik-Connect bằng SADP tool', () {}),
    //       Divider(color: colorGrey),
    //       SupportSolutionMenuView('Hướng dẫn cài đặt tên miền CameraDDNS', () {}),
    //       Divider(color: colorGrey),
    //       SupportSolutionMenuView('Hướng dẫn cấu hình sử dụng Hik-Connect trên điện thoại và máy tính', () {}),
    //       Divider(color: colorGrey),
    //       SupportSolutionMenuView('Hướng dẫn khôi phục (Reset) mật khẩu thiết bị', () {}),
    //       Divider(color: colorGrey),
    //       SupportSolutionMenuView('Hướng dẫn cấu hình chức năng nhận diện khuôn mặt', () {}),
    //       Divider(color: colorGrey),
    //     ],
    //   ),
    // );
  }

  Future<List<SupportObject>?> loadData(int currentPage) =>
      context.read(supportSolutionViewModel).loadSolutions(currentPage);
}
