import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_textstyle.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final TextStyle? style;
  final BorderType borderType;
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final String? hintText;
  final String? errorText;
  final String? labelText;
  final TextStyle? labelStyle;

  TextFieldPassword(
      {required this.controller,
      this.prefixIcon,
      this.hintText,
      this.errorText,
      this.labelText,
      this.style,
      this.labelStyle,
      this.prefixIconSize,
      required this.borderType});

  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> with TextFieldConfig {
  bool _isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
            visible: widget.labelText?.isNotEmpty ?? false,
            child: Column(
              children: [
                Text(widget.labelText ?? '', style: widget.labelStyle ?? TextStyle(color: focusColor)),
                const SizedBox(height: 3),
              ],
            )),
        TextFormField(
          style: widget.style ?? styleInputText,
          showCursor: true,
          autofocus: false,
          obscureText: _isHidePassword,
          decoration: InputDecoration(
            enabledBorder: getEnableBorder(widget.borderType),
            focusedBorder: getFocusBorder(widget.borderType),
            focusColor: focusColor,
            prefixIcon: widget.prefixIcon,
            hintStyle: styleHintText,
            hintText: widget.hintText,
            isDense: true,
            prefixIconConstraints: BoxConstraints(
                minWidth: widget.prefixIconSize ?? 25,
                minHeight: widget.prefixIconSize ?? 25,
                maxHeight: widget.prefixIconSize ?? 25,
                maxWidth: widget.prefixIconSize ?? 25),
            suffixIconConstraints: const BoxConstraints(minWidth: 25, minHeight: 25, maxHeight: 25, maxWidth: 25),
            suffixIcon: IconButton(
                icon: Icon(_isHidePassword ? Icons.visibility : Icons.visibility_off, color: Colors.grey, size: 20.h),
                onPressed: () {
                  setState(() {
                    _isHidePassword = !_isHidePassword;
                  });
                }),
          ),
          controller: widget.controller,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return widget.hintText;
            }
            return null;
          },
        )
      ],
    );
  }
}
