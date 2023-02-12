import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_normal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../constants.dart';

void showAlert({
  required BuildContext context,
  required String message,
  String? title,
  VoidCallback? onPressOk,
}) async {
  final result = await showAlertDialog<OkCancelResult>(
    context: context,
    title: title,
    message: message,
    actions: [AlertDialogAction(label: "OK", key: OkCancelResult.ok)],
  );
  if (result == OkCancelResult.ok) {
    onPressOk?.call();
  }
}

void showAlertConfirm({
  required BuildContext context,
  required String message,
  String? title,
  VoidCallback? onPressOk,
  VoidCallback? onPressCancel,
  String? leftButtonText,
  String? rightButtonText,
}) async {
  final result = await showAlertDialog<OkCancelResult>(
    context: context,
    title: title,
    message: message,
    actions: [
      AlertDialogAction(label: leftButtonText ?? "OK", key: OkCancelResult.ok),
      AlertDialogAction(label: rightButtonText ?? "Cancel", key: OkCancelResult.cancel),
    ],
  );
  if (result == OkCancelResult.ok) {
    onPressOk?.call();
  } else if (result == OkCancelResult.cancel) {
    onPressCancel?.call();
  }
}

void showAlertSuccess({
  required BuildContext context,
  String? message,
  VoidCallback? onPressOk,
}) async {
  Alert(
    context: context,
    title: message ?? "Thành công",
    style: AlertStyle(titleStyle: styleTextBlackBold(20), descStyle: styleTextBlack(19)),
    image: Icon(Icons.check_circle_outline, color: Colors.green, size: 60.w),
    alertAnimation: (context, animation, secondaryAnimation, child) {
      return Align(child: FadeTransition(opacity: animation, child: child));
    },
    buttons: [
      DialogButton(
        color: colorPrimary,
        child: Text("OK", style: styleTextWhite()),
        onPressed: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            onPressOk?.call();
          });
          Navigator.of(context, rootNavigator: true).pop();
        },
        width: 100.w,
      )
    ],
  ).show();
}

void showAlertError({
  required BuildContext context,
  String? message,
  VoidCallback? onPressOk,
}) async {
  Alert(
    context: context,
    title: message ?? "error",
    style: AlertStyle(titleStyle: styleTextBlackBold(20), descStyle: styleTextBlack(19)),
    image: Icon(Icons.cancel_outlined, color: Colors.red, size: 60.w),
    alertAnimation: (context, animation, secondaryAnimation, child) {
      return Align(child: FadeTransition(opacity: animation, child: child));
    },
    buttons: [
      DialogButton(
        color: colorPrimary,
        child: Text("OK", style: styleTextWhite()),
        onPressed: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            if (message == "INVALID_TOKEN") {
              Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Constants.pageLogin, (route) => false);
              return;
            }
            onPressOk?.call();
          });
          Navigator.of(context, rootNavigator: true).maybePop();
          // Navigator.maybePop(this);
        },
        width: 100.w,
      )
    ],
  ).show();
}

void showAlertInputText({
  required BuildContext context,
  required String message,
  String? hint,
  Function(String)? onPressOk,
}) {
  final ted = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Alert(
    context: context,
    title: message,
    content: Container(
      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
      child: Form(
        key: _formKey,
        child: TextFieldNormal(
          hintText: hint,
          controller: ted,
          borderType: BorderType.typeUnderLine,
        ),
      ),
    ),
    buttons: [
      DialogButton(
        color: colorPrimary,
        child: Text("OK", style: styleTextWhite()),
        onPressed: () {
          if (!(_formKey.currentState?.validate() == true)) return;
          Future.delayed(const Duration(milliseconds: 100), () {
            onPressOk?.call(ted.text);
          });
          Navigator.of(context, rootNavigator: true).pop();
          // Navigator.maybePop(this);
        },
        width: 80.w,
      ),
      DialogButton(
        color: colorPrimary,
        child: Text("Cancel", style: styleTextWhite()),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        width: 80.w,
      )
    ],
  ).show();
}
