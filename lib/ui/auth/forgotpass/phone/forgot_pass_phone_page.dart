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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants.dart';
import 'forgot_pass_phone_view_model.dart';

class ForgotPassPhonePage extends StatefulWidget {
  @override
  _ForgotPassPhonePageState createState() => _ForgotPassPhonePageState();
}

class _ForgotPassPhonePageState extends State<ForgotPassPhonePage> {
  TextEditingController phoneTed = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BaseContainer(
        provider: forgotPassPhoneViewModel,
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
                Text('Quên mã pin', style: styleTextWhiteBold(20)),
                SizedBox(height: 100.h),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w, bottom: 30.w),
                  decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Nhập số điện thoại để nhận mã xác thực tài khoản',
                            style: styleTextBlack(), textAlign: TextAlign.center),
                        SizedBox(height: 20.h),
                        TextFieldNormal(
                          controller: phoneTed,
                          borderType: BorderType.typeUnderLine,
                          prefixIcon: Icon(Icons.phone, color: colorGrey),
                          hintText: 'Số điện thoại',
                        ),
                        SizedBox(height: 30.h),
                        HookBuilder(builder: (_) {
                          final isLoading = useProvider(forgotPassPhoneViewModel.select((value) => value.isLoading));
                          if (isLoading)
                            return ButtonGrey(text: 'Tiếp tục');
                          else
                            return ButtonSolid(text: 'Tiếp tục', onPress: _requestOtpForgotPass);
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _requestOtpForgotPass() {
    if (!kReleaseMode && Constants.isTestUIAuth) {
      Navigator.pushNamed(context, Constants.pageMaster);
      return;
    }

    if (!kReleaseMode && phoneTed.text.isEmpty) {
      phoneTed.text = '0368179011';
    }
    if (!(_formKey.currentState?.validate() == true)) return;
    context.read(forgotPassPhoneViewModel).requestOtpForgotPass(phoneTed.text).then((value) {
      if (value == true) {
        Navigator.pushNamed(context, Constants.pageForgotPassOtp, arguments: phoneTed.text);
      }
    });
  }
}
