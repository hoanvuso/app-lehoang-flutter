import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_webview.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/ui/notification/detailsystem/notification_system_detail_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationSystemDetailPage extends StatefulWidget {
  @override
  _NotificationSystemDetailPageState createState() => _NotificationSystemDetailPageState();
}

class _NotificationSystemDetailPageState extends State<NotificationSystemDetailPage> with BaseWebView{

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value != null) {
      final viewModel = context.read(notificationSystemDetailViewModel);
      if (value is int) {
        viewModel.loadDetailNotification(value);
      } else {
        showErrorToast(context: context, message: 'Không có thông báo này');
      }
    }

    return BaseContainer(
      provider: notificationSystemDetailViewModel,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            HookBuilder(builder: (_) {
              final newObject = useProvider(notificationSystemDetailViewModel.select((value) => value.newObject));
              return CommonTopbar(newObject?.name ?? 'Thông báo');
            }),
            SizedBox(height: 10.h),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return HookBuilder(builder: (_) {
      final newObject = useProvider(notificationSystemDetailViewModel.select((value) => value.newObject));
      return buildWebView(
        htmlStr: newObject?.body
      );
      // return Html(
      //   style: {
      //     "body": Style(
      //         fontSize: FontSize(15.sp),
      //         // fontWeight: FontWeight.bold,
      //         color: Colors.black),
      //   },
      //   shrinkWrap: true,
      //   data: newObject?.body ?? '',
      // );
    });
  }
}
