import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/utils/util/time_util.dart';
import 'package:intl/intl.dart';

import '../../app_colors.dart';
import '../../app_textstyle.dart';

class TimePickerNormal extends StatelessWidget with TextFieldConfig {
  TextEditingController? controller;

  final void Function(DateTime)? onSelectedTime;
  final String? formatTime;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle? style;

  // Custom
  bool? isAutoSetTextController = true;
  final BorderType? borderType;
  final String? errorText;
  final TextStyle? labelStyle;

  TimePickerNormal(
      {controller,
      this.prefixIcon,
      this.hintText,
      this.errorText,
      this.labelText,
      this.labelStyle,
      this.maxLines,
      this.onSelectedTime,
      this.formatTime,
      this.isAutoSetTextController,
      required this.borderType,
      this.style, this.textAlign}) {
    if (controller == null) {
      this.controller = TextEditingController();
    } else
      this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    var initDateTime;
    if (controller?.text.isNotEmpty ?? false) {
      initDateTime = DateFormat(formatTime ?? DATE_FORMAT_6).parse(controller!.text);
    } else {
      initDateTime = DateTime.now();
    }

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
        InkWell(
          onTap: () {
            DatePicker.showTimePicker(
              context,
              showSecondsColumn: false,
              showTitleActions: true,
              currentTime: initDateTime,
              theme: DatePickerTheme(
                headerColor: colorPrimary,
                backgroundColor: Colors.white,
                itemStyle: styleTextPrimaryBold(),
                doneStyle: styleTextWhiteBold(),
              ),
              // onChanged: onSelectedDate,
              onConfirm: (dateTime) {
                if (isAutoSetTextController == true)
                  controller?.text = DateFormat(formatTime ?? DATE_FORMAT_6).format(dateTime);
                onSelectedTime?.call(dateTime);
              },
            );
          },
          child: IgnorePointer(
            ignoring: true,
            child: TextFormField(
              autofocus: false,
              readOnly: true,
              enableSuggestions: false,
              enableInteractiveSelection: false,
              validator: (v) {
                return (controller?.text.isEmpty ?? false) ? hintText : null;
              },
              style: style ?? styleInputText,
              textAlign: textAlign ?? TextAlign.start,
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: getEnableBorder(borderType),
                focusedBorder: getFocusBorder(borderType),
                focusColor: focusColor,
                prefixIcon: prefixIcon,
                hintStyle: styleHintText,
                hintText: hintText,
                // contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        )
      ],
    );
  }
}
