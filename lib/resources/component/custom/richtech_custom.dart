import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import '../../app_textstyle.dart';

class RichTextCustom extends StatelessWidget {
  final List<InlineSpan>? children;
  final int? maxLines;
  final TextAlign? textAlign;

  RichTextCustom({this.children, this.maxLines, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      text: TextSpan(
        children: children,
      ),
    );
  }
}
