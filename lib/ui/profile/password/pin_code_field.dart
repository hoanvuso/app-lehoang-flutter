import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  PinCodeField({this.onCompleted, this.onChanged, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode?.requestFocus();
        FocusScope.of(context).unfocus();
        Timer(const Duration(milliseconds: 1), () {
          FocusScope.of(context).requestFocus(focusNode);
        });
      },
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        child: Container(
          width: 160.w,
          decoration: decorOnlyBorder(radius: 20.r, color: Colors.black),
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 14.h, bottom: 14.h),
          child: Center(
            child: PinCodeTextField(
              focusNode: focusNode,
              length: 6,
              obscureText: true,
              errorTextSpace: 0,
              showCursor: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 12.h,
                  fieldWidth: 12.w,
                  disabledColor: Colors.white,
                  //màu của viền ô vuông đang được điền
                  selectedColor: colorGrey,
                  //màu của viền ô vuông sau khi điền
                  activeColor: colorGrey,
                  //màu của viền ô vuông trước khi điền
                  inactiveColor: colorGrey,
                  //màu của ô vuông đang được điền
                  selectedFillColor: colorGrey,
                  //màu của ô vuông trước khi điền
                  inactiveFillColor: colorGrey,
                  //màu của ô vuông sau khi điền
                  activeFillColor: Colors.black),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              //màu background ở sau ô vuông
              keyboardType: TextInputType.number,
              enableActiveFill: true,
              textStyle: const TextStyle(color: Colors.black),
              // controller: otpTed,
              onCompleted: onCompleted,
              onChanged: (value) {
                onChanged?.call(value);
              },
              appContext: context,
            ),
          ),
        ),
      ),
    );
  }
}
