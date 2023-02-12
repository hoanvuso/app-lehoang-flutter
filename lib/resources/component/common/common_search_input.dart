import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_normal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_textstyle.dart';
import 'icon_button_back.dart';

class CommonSearchInput extends StatelessWidget {
  String? hint;
  ValueChanged<String>? onSearch;
  ValueChanged<String>? onSearchDebounce;

  CommonSearchInput({this.hint, this.onSearch, this.onSearchDebounce});

  TextEditingController searchTed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorSolidRound(circularSize: 5.r, color: Colors.white),
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h, bottom: 3.h),
      child: TextFieldNormal(
        controller: searchTed,
        borderType: BorderType.typeNone,
        prefixIcon: Icon(Icons.search, color: colorGrey, size: 25.h),
        hintText: hint,
        onFieldSubmitted: onSearch,
        onChangedDebounce: onSearchDebounce,
        style: styleTextBlack(15),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
