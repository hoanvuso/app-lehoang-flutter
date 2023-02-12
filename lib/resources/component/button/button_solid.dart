import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../app_textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSolid extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final height;
  final width;
  final borderRadius;
  final color;

  ButtonSolid({required this.text, required this.onPress, this.height, this.width, this.color, this.borderRadius});

  int? currentTimeClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
              side: const BorderSide(color: Color(0xFF8F8F8F)),
            ),
            primary: color ?? colorPrimary),
        onPressed: () {
          final now = DateTime.now().millisecondsSinceEpoch;
          print(currentTimeClick);
          print(now);
          if (currentTimeClick == null || (now - currentTimeClick! > 1000)) {
            currentTimeClick = now;
            onPress.call();
          }
          // onPress.call();
        },
        child: Text(text, style: styleTextWhiteBold(), textAlign: TextAlign.center),
      ),
    );
  }
}
