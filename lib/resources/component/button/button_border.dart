import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../app_textstyle.dart';

class ButtonBorder extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double? height;
  final double? width;
  final Color? color;

  ButtonBorder({required this.text, required this.onPress, this.height, this.width, this.color});

  int? currentTimeClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Color(0xFF8F8F8F), width: 2),
            ),
            primary: Colors.white,
            onPrimary: color ?? colorGrey),
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
        child: Text(text, style: styleTextGreyBold()),
      ),
    );
  }
}
