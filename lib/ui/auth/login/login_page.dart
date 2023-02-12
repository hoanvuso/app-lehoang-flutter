import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_grey.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_back.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_normal.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_password.dart';
import 'package:flutter_lehoang_extracare/ui/auth/login/login_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneTed = TextEditingController();
  TextEditingController passwordTed = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BaseContainer(
        provider: loginViewModel,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Đăng nhập', style: styleTextWhiteBold(20)),
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
                        SizedBox(height: 30.h),
                        HookBuilder(builder: (_) {
                          final isLoading = useProvider(loginViewModel.select((value) => value.isLoading));
                          if (isLoading)
                            return ButtonGrey(text: 'Đăng nhập');
                          else
                            return ButtonSolid(text: 'Đăng nhập', onPress: _login);
                        })
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Constants.pageRegister);
                    },
                    child: Text('Đăng ký', style: styleTextWhiteBold())),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Constants.pageForgotPassPhone);
                    },
                    child: Text('Quên mã pin?', style: styleTextWhiteBold()))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    if (!kReleaseMode && Constants.isTestUIAuth) {
      Navigator.pushNamed(context, Constants.pageMaster);
      return;
    }

    if (!kReleaseMode && phoneTed.text.isEmpty && passwordTed.text.isEmpty) {
      phoneTed.text = '0368179011';
      passwordTed.text = '123456';
    }
    if (!(_formKey.currentState?.validate() == true)) return;
    context.read(loginViewModel).login(phoneTed.text, passwordTed.text).then((value) {
      if (value != null) {
        Navigator.pushNamed(context, Constants.pageMaster);
      }
    });
  }
}
