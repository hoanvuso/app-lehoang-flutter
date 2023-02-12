import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/list_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/support/document/support_document_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/support/solution/component/support_solution_menu_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';

class SupportDocumentPage extends StatefulWidget {
  @override
  _SupportDocumentPageState createState() => _SupportDocumentPageState();
}

class _SupportDocumentPageState extends State<SupportDocumentPage> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      provider: supportDocumentViewModel,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            CommonTopbar('Tài liệu'),
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
              Navigator.pushNamed(context, Constants.pageSupportDocumentDetail, arguments: supportObject);
            }),
            Divider(color: colorGrey),
          ],
        ),
        childViewShimmer: SizedBox(),
        loadData: loadData,
        onClickItem: null,
      ),
    );
  }

  Future<List<SupportObject>?> loadData(int currentPage) =>
      context.read(supportDocumentViewModel).loadDocuments(currentPage);
}
