import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_textstyle.dart';
import 'icon_button_back.dart';

class CommonTitleTopbar extends StatelessWidget {
  final String text;
  final VoidCallback? onBackPress;

  CommonTitleTopbar(this.text, {this.onBackPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [IconButtonBack(onPress: onBackPress), Text(text, style: styleTextWhite())],
    );
  }
}
