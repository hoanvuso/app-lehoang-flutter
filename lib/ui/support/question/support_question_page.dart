import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_webview.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_close.dart';
import 'package:flutter_lehoang_extracare/resources/component/loadmore/list_view_load_more.dart';
import 'package:flutter_lehoang_extracare/ui/support/question/support_question_view_model.dart';
import 'package:flutter_lehoang_extracare/ui/support/solution/component/support_solution_menu_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportQuestionPage extends StatefulWidget {
  @override
  _SupportQuestionPageState createState() => _SupportQuestionPageState();
}

class _SupportQuestionPageState extends State<SupportQuestionPage> with BaseWebView {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      provider: supportQuestionViewModel,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            CommonTopbar('Các câu hỏi thường gặp'),
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
              _showAnswerDetail(supportObject);
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
    //       SupportSolutionMenuView('Hướng dẫn cấu hình chức năng nhận diện khuôn mặt', () {
    //         _showAnswerDetail();
    //       }),
    //       Divider(color: colorGrey),
    //     ],
    //   ),
    // );
  }

  Future<List<SupportObject>?> loadData(int currentPage) =>
      context.read(supportQuestionViewModel).loadFrequentlyQuestion(currentPage);

  void _showAnswerDetail(SupportObject supportObject) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w, bottom: 50.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Text(supportObject.name ?? 'Không có tên', style: styleTextBlackBold(18))),
                SizedBox(width: 10.w),
                IconButtonClose(
                  onPress: () {
                    Navigator.maybePop(context);
                  },
                  color: colorGrey,
                  size: 25.h,
                )
              ],
            ),
            SizedBox(height: 15.h),
            ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 0.3.sh), child: buildWebView(htmlStr: supportObject.body)),
            // Html(
            //   style: {
            //     "body": Style(
            //         // fontSize: FontSize(18.0),
            //         // fontWeight: FontWeight.bold,
            //         color: Colors.black),
            //   },
            //   shrinkWrap: true,
            //   data: supportObject.body ?? 'Không có nội dung',
            // ),
            SizedBox(height: 15.h),
            Divider(color: colorGrey),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text('Liên hệ', style: styleTextGreyBold()),
                SizedBox(width: 15.w),
                GestureDetector(
                    onTap: () {
                      final zalo = context.read(prefsProvider).getZaloValue();
                      launch('http://zalo.me/${zalo}');
                    },
                    child: Assets.images.icZalo.image(width: 30.h, height: 30.h)),
                SizedBox(width: 15.w),
                GestureDetector(
                    onTap: () {
                      final facebook = context.read(prefsProvider).getFacebookValue();
                      launch(facebook ?? 'https://www.facebook.com/');
                    },
                    child: Assets.images.icFacebook.image(width: 30.h, height: 30.h)),
                SizedBox(width: 15.w),
                GestureDetector(
                    onTap: () {
                      final hotline = context.read(prefsProvider).getHotlineValue();
                      launch("tel://${hotline}");
                    },
                    child: Assets.images.icPhone.image(width: 30.h, height: 30.h)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
