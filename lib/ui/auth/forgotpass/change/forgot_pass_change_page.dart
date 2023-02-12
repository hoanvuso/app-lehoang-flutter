import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_grey.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_back.dart';
import 'package:flutter_lehoang_extracare/ui/profile/password/pin_code_field.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants.dart';
import 'forgot_pass_change_view_model.dart';

class ForgotPassChangePage extends StatefulWidget {
  @override
  _ForgotPassChangePageState createState() => _ForgotPassChangePageState();
}

class _ForgotPassChangePageState extends State<ForgotPassChangePage> {
  String? newPass, reNewPass;

  late FocusNode f1, f2;

  @override
  void initState() {
    super.initState();
    f1 = FocusNode();
    f2 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final requestRegister = ModalRoute.of(context)?.settings.arguments as RequestChangeForgotPass;
    context.read(forgotPassChangeViewModel).username = requestRegister.username;
    context.read(forgotPassChangeViewModel).otp = requestRegister.token;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BaseContainer(
        provider: forgotPassChangeViewModel,
        child: Stack(
          children: [
            Assets.images.background2.image(width: double.infinity, height: double.infinity, fit: BoxFit.cover),
            Positioned(
                top: 30.h,
                left: 15.w,
                child: IconButtonBack(onPress: () {
                  Navigator.maybePop(context);
                })),
            Column(
              children: [
                SizedBox(height: 100.h),
                Text('Nhập mã pin mới', style: styleTextWhiteBold(20)),
                SizedBox(height: 30.h),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w, bottom: 30.w),
                  decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Nhập mã pin mới', style: styleTextBlack(14), textAlign: TextAlign.center),
                      SizedBox(height: 10.h),
                      PinCodeField(
                        onChanged: (newPass) {
                          this.newPass = newPass;
                        },
                        focusNode: f1,
                      ),
                      SizedBox(height: 20.h),
                      Text('Nhập lại mã pin mới', style: styleTextBlack(14), textAlign: TextAlign.center),
                      SizedBox(height: 10.h),
                      PinCodeField(
                        onChanged: (reNewPass) {
                          this.reNewPass = reNewPass;
                        },
                        focusNode: f2,
                      ),
                      SizedBox(height: 30.h),
                      HookBuilder(builder: (_) {
                        final isLoading = useProvider(forgotPassChangeViewModel.select((value) => value.isLoading));
                        if (isLoading)
                          return ButtonGrey(text: 'Tiếp tục');
                        else
                          return ButtonSolid(text: 'Tiếp tục', onPress: _changePass);
                      })
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _changePass() {
    if (newPass == null || newPass?.isEmpty == true) {
      showToast(context: context, message: 'Hãy nhập mật khẩu mới');
      return;
    }

    if (reNewPass == null || reNewPass?.isEmpty == true) {
      showToast(context: context, message: 'Hãy nhập lại mật khẩu mới');
      return;
    }

    if (newPass != reNewPass) {
      showToast(context: context, message: 'Mã pin nhập lại không đúng');
      return;
    }

    context.read(forgotPassChangeViewModel).changePassword(newPass!, reNewPass!).then((value) {
      if (value != null) {
        showSuccessToast(context: context, message: 'Cập nhật mật khẩu mới thành công');
        Navigator.pushNamedAndRemoveUntil(context, Constants.pageMaster, (route) => false);
      }
    });
  }
}
