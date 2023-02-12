import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_password.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_password.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'change_pass_view_model.dart';

class ChangePassPage extends StatefulWidget {
  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  TextEditingController currentPassTed = TextEditingController();
  TextEditingController newPassTed = TextEditingController();
  TextEditingController reNewPassTed = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: BaseContainer(
        provider: changePassViewModel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [CommonTopbar("Đổi mật khẩu"), SizedBox(height: 20.h), Expanded(child: _buildMainView())],
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFieldPassword(
              controller: currentPassTed,
              prefixIcon: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Assets.images.icPassLogin.image(width: 10.h, height: 10.h, fit: BoxFit.contain)),
              prefixIconSize: 35.w,
              style: styleTextBlack(),
              hintText: "Nhập mật khẩu hiện tại",
              borderType: BorderType.typeRoundBorder,
            ),
            SizedBox(height: 15.h),
            TextFieldPassword(
              controller: newPassTed,
              prefixIcon: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Assets.images.icPassLogin.image(width: 10.h, height: 10.h, fit: BoxFit.contain)),
              prefixIconSize: 35.w,
              style: styleTextBlack(),
              hintText: "Nhập mật khẩu mới",
              borderType: BorderType.typeRoundBorder,
            ),
            SizedBox(height: 15.h),
            TextFieldPassword(
              controller: reNewPassTed,
              prefixIcon: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Assets.images.icPassLogin.image(width: 10.h, height: 10.h, fit: BoxFit.contain)),
              prefixIconSize: 35.w,
              style: styleTextBlack(),
              hintText: "Nhập lại mật khẩu mới",
              borderType: BorderType.typeRoundBorder,
            ),
            SizedBox(height: 35.h),
            ButtonSolid(text: "Đồng ý", onPress: _changPass),
          ],
        ),
      ),
    );
  }

  void _changPass() {
    if (!(_formKey.currentState?.validate() == true)) {
      showErrorToast(context: context, message: "Hãy điền đủ thông tin bắt buộc");
      return;
    }

    final viewModel = context.read(changePassViewModel);

    if (newPassTed.text != reNewPassTed.text) {
      showErrorToast(context: context, message: "Mật khẩu nhập lại không đúng");
      return;
    }

    final request = RequestChangePassword(
        old_password: currentPassTed.text, password: newPassTed.text, password_confirmation: reNewPassTed.text);
    viewModel.changePassword(request).then((value) {
      if (value != null) {
        showSuccessToast(context: context, message: 'Thay đổi mật khẩu thành công');
        Navigator.maybePop(context);
      }
    });
  }
}
