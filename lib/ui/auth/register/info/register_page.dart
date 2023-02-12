import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_register.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_back.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_normal.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_password.dart';
import 'package:flutter_lehoang_extracare/ui/auth/register/info/register_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneTed = TextEditingController();
  TextEditingController passwordTed = TextEditingController();
  TextEditingController rePasswordTed = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BaseContainer(
        provider: registerViewModel,
        child: Stack(
          children: [
            Assets.images.background2.image(width: double.infinity, height: double.infinity, fit: BoxFit.cover),
            Positioned(
                top: 30.h,
                left: 15.w,
                child: IconButtonBack(onPress: () {
                  Navigator.maybePop(context);
                })),
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Đăng ký', style: styleTextWhiteBold(20)),
                    SizedBox(height: 30.h),
                    Assets.images.logoLehoang.image(width: 200.w, height: 100.h),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w, bottom: 30.w),
                      decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFieldNormal(
                              controller: phoneTed,
                              borderType: BorderType.typeUnderLine,
                              prefixIcon: Icon(Icons.phone, color: colorGrey),
                              hintText: 'Số điện thoại',
                            ),
                            SizedBox(height: 10.h),
                            TextFieldPassword(
                              controller: passwordTed,
                              borderType: BorderType.typeUnderLine,
                              prefixIcon: Icon(Icons.lock, color: colorGrey),
                              hintText: 'Nhập mã pin',
                            ),
                            SizedBox(height: 10.h),
                            TextFieldPassword(
                              controller: rePasswordTed,
                              borderType: BorderType.typeUnderLine,
                              prefixIcon: Icon(Icons.lock, color: colorGrey),
                              hintText: 'Nhập lại mã pin',
                            ),
                            SizedBox(height: 30.h),
                            ButtonSolid(text: 'Đăng ký', onPress: _register)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register() {
    if (!kReleaseMode && Constants.isTestUIAuth) {
      Navigator.pushNamed(context, Constants.pageRegisterVerify);
      return;
    }

    if (!(_formKey.currentState?.validate() == true)) return;
    if (passwordTed.text != rePasswordTed.text) {
      showToast(context: context, message: 'Mật khẩu nhập lại không đúng');
      return;
    }

    // final argument = RequestRegister(username: phoneTed.text, password: passwordTed.text);
    // Navigator.pushNamed(context, Constants.pageRegisterVerify, arguments: argument);

    context.read(registerViewModel).register(phoneTed.text, passwordTed.text).then((value) {
      if (value == true) {
        final argument = RequestRegister(username: phoneTed.text, password: passwordTed.text);
        Navigator.pushNamed(context, Constants.pageRegisterVerify, arguments: argument);
      }
    });
  }
}
