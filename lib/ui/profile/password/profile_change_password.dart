import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_password.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/ui/profile/password/pin_code_field.dart';
import 'package:flutter_lehoang_extracare/ui/profile/profile_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileChangePassword extends StatefulWidget {
  @override
  _ProfileChangePasswordState createState() => _ProfileChangePasswordState();
}

class _ProfileChangePasswordState extends State<ProfileChangePassword> {
  String? oldPass, newPass, reNewPass;

  late FocusNode f1, f2, f3;

  @override
  void initState() {
    super.initState();
    f1 = FocusNode();
    f2 = FocusNode();
    f3 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    f1.dispose();
    f2.dispose();
    f3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        // padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w, bottom: 50.h),
        padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Đổi mã pin', style: styleTextBlackBold()),
            ),
            SizedBox(height: 5.h),
            Divider(color: colorGrey),
            Text('Nhập mã pin cũ', style: styleTextBlack()),
            SizedBox(height: 15.h),
            PinCodeField(
              onChanged: (oldPass) {
                this.oldPass = oldPass;
              },
              onCompleted: (oldPass) {
                this.oldPass = oldPass;
                _changePass();
              },
              focusNode: f1,
            ),
            SizedBox(height: 15.h),
            Text('Nhập mã pin mới', style: styleTextBlack()),
            SizedBox(height: 15.h),
            PinCodeField(
              onChanged: (newPass) {
                this.newPass = newPass;
              },
              onCompleted: (newPass) {
                this.newPass = newPass;
                _changePass();
              },
              focusNode: f2,
            ),
            SizedBox(height: 15.h),
            Text('Nhập lại mã pin mới', style: styleTextBlack()),
            SizedBox(height: 15.h),
            PinCodeField(
              onChanged: (reNewPass) {
                this.reNewPass = reNewPass;
              },
              onCompleted: (reNewPass) {
                this.reNewPass = reNewPass;
                _changePass();
              },
              focusNode: f3,
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  void _changePass() {
    if (oldPass == null || oldPass?.isEmpty == true) {
      // FocusScope.of(context).requestFocus(f1);
      return;
    }

    if (newPass == null || newPass?.isEmpty == true) {
      // FocusScope.of(context).requestFocus(f2);
      return;
    }

    if (reNewPass == null || reNewPass?.isEmpty == true) {
      // FocusScope.of(context).requestFocus(f3);
      return;
    }

    if (newPass != reNewPass) {
      showToast(context: context, message: 'Mã pin nhập lại không đúng');
      return;
    }

    final request = RequestChangePassword(old_password: oldPass, password: newPass, password_confirmation: reNewPass);
    context.read(profileViewModel).changePassword(request).then((value) {
      if (value != null) {
        showSuccessToast(context: context, message: 'Thay đổi mật khẩu thành công');
        Navigator.maybePop(context);
      }
    });
  }
}
