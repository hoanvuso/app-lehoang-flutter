import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:intl/intl.dart';

import '../../app_textstyle.dart';

class TextFieldNormal extends StatelessWidget with TextFieldConfig {
  final TextEditingController controller;
  final TextStyle? style;
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final String? suffixText;
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? isReadOnly;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  // Custom
  final BorderType? borderType;
  final String? errorText;
  final TextStyle? labelStyle;
  final bool? isFormatCurrency;

  ValueChanged<String>? onChangedDebounce;
  Timer? _debounce;

  TextFieldNormal({
    required this.controller,
    this.prefixIcon,
    this.suffixText,
    this.hintText,
    this.errorText,
    this.prefixIconSize,
    this.labelText,
    this.style,
    this.maxLines,
    this.labelStyle,
    this.borderType,
    this.textAlign,
    this.keyboardType = TextInputType.text,
    this.isReadOnly,
    this.isFormatCurrency,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onChangedDebounce,
  });

  String _formatNumber(String s) => NumberFormat.decimalPattern('en').format(int.parse(s));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: labelText?.isNotEmpty ?? false,
            child: Column(
              children: [
                Text(labelText ?? '', style: labelStyle ?? TextStyle(color: focusColor)),
                const SizedBox(height: 3),
              ],
            )),
        TextFormField(
          style: style ?? styleInputText,
          showCursor: true,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          autofocus: false,
          readOnly: isReadOnly ?? false,
          enableInteractiveSelection: !(isReadOnly ?? false),
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            enabledBorder: getEnableBorder(borderType),
            focusedBorder: getFocusBorder(borderType),
            focusColor: focusColor,
            prefixIcon: prefixIcon,
            hintStyle: styleHintText,
            hintText: hintText,
            suffixText: suffixText,
            isDense: true,
            prefixIconConstraints: BoxConstraints(
                minWidth: prefixIconSize ?? 25,
                minHeight: prefixIconSize ?? 25,
                maxHeight: prefixIconSize ?? 25,
                maxWidth: prefixIconSize ?? 25),
            suffixIconConstraints: const BoxConstraints(minWidth: 25, minHeight: 25, maxHeight: 25, maxWidth: 25),
            // errorText: widget.errorText,
          ),
          textAlign: textAlign ?? TextAlign.start,
          controller: controller,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return (errorText ?? hintText);
            }
            return null;
          },
          onChanged: isFormatCurrency == true
              ? (string) {
                  string = '${_formatNumber(string.replaceAll(',', ''))}';
                  controller.value = TextEditingValue(
                    text: string,
                    selection: TextSelection.collapsed(offset: string.length),
                  );
                  _onChanged(string);
                }
              : _onChanged,
        )
      ],
    );
  }

  _onChanged(String query) {
    if (onChangedDebounce == null) return;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      onChangedDebounce?.call(query);
    });
  }
}
