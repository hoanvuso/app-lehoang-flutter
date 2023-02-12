import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_change_forgot_pass.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_back.dart';
import 'package:flutter_lehoang_extracare/ui/auth/forgotpass/otp/forgot_pass_otp_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants.dart';

class ForgotPassOtpPage extends StatefulWidget {
  @override
  _ForgotPassOtpPageState createState() => _ForgotPassOtpPageState();
}

class _ForgotPassOtpPageState extends State<ForgotPassOtpPage> {
  TextEditingController otpTed = TextEditingController();
  CountdownTimerController? _timeController;

  @override
  void initState() {
    super.initState();
    _timeController = CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch + 3000 * 60,
      onEnd: () {
        context.read(forgotPassOtpViewModel).setResendAble(true);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timeController?.dispose();
    otpTed.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(forgotPassOtpViewModel);
    final phone = ModalRoute.of(context)?.settings.arguments as String;
    viewModel.username = phone;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BaseContainer(
        provider: forgotPassOtpViewModel,
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
                SizedBox(height: 30.h),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w, bottom: 30.w),
                  decoration: decorSolidRound(circularSize: 10.r, color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Mã kích hoạt đã gửi đến điện thoại của bạn: ${viewModel.username}. Nhập mã bên dưới',
                          textAlign: TextAlign.center, style: styleTextBlack()),
                      SizedBox(height: 20.h),
                      _buildCountDownTimer(),
                      SizedBox(height: 30.h),
                      _builtOtpInput()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountDownTimer() {
    return Column(
      children: [
        HookBuilder(builder: (_) {
          final isEnable = useProvider(forgotPassOtpViewModel.select((value) => value.isResendAble));
          if (isEnable) {
            return InkWell(
              onTap: _resendOtp,
              child: Text('Gửi lại mã', style: styleTextPrimaryBold()),
            );
          } else {
            _timeController?.start();
            return CountdownTimer(
              widgetBuilder: (_, time) => time == null
                  ? const SizedBox()
                  : Text(
                      '(${time.min}:${time.sec} s)',
                      style: styleTextPrimaryBold(),
                    ),
              controller: _timeController,
            );
          }
        }),
        SizedBox(height: 10.h),
        Text('Gửi lại mã xác nhận ?', style: styleTextGrey()),
      ],
    );
  }

  Widget _builtOtpInput() {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50.h,
          fieldWidth: 40.w,
          disabledColor: Colors.white,
          //màu của viền ô vuông đang được chọn
          selectedColor: colorGrey,
          //màu của viền ô vuông trước khi điền
          inactiveColor: colorGrey,
          //màu của viền ô vuông sau khi điền
          activeColor: colorGrey,
          //màu của ô vuông đang được chọn
          selectedFillColor: colorGrey,
          //màu của ô vuông trước khi điền
          inactiveFillColor: colorGrey,
          //màu của ô vuông sau khi điền
          activeFillColor: colorGrey),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      //màu background ở sau ô vuông
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      textStyle: const TextStyle(color: Colors.black),
      // controller: otpTed,
      onCompleted: _confirmOtp,
      onChanged: (value) {},
      appContext: context,
    );
  }

  void _resendOtp() {
    final viewModel = context.read(forgotPassOtpViewModel);
    if (_timeController != null) _timeController?.dispose();
    _timeController = CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch + 3000 * 60,
      onEnd: () {
        viewModel.setResendAble(true);
      },
    );
    viewModel.setResendAble(false);
    viewModel.resendOtp().then((value) {
      if (value == true) {
        showToast(context: context, message: 'Hệ thống đã gửi lại mã cho bạn');
      }
    });
  }

  void _confirmOtp(String otp) {
    final viewModel = context.read(forgotPassOtpViewModel);
    viewModel.verifyOtpForgotPass(otp).then((value) {
      if (value == true) {
        Navigator.pushNamed(context, Constants.pageForgotPassChange,
            arguments: RequestChangeForgotPass(
              username: viewModel.username,
              token: otp,
            ));
      }
    });
  }
}
