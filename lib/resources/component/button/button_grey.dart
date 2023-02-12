import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_textstyle.dart';

class ButtonGrey extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final double? height;
  final double? width;


  ButtonGrey({required this.text, this.onPress, this.height, this.width});

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
            side: const BorderSide(color: Color(0xFF8F8F8F)),
          ),
          primary: Colors.grey,
        ),
        onPressed: () {
          final now = DateTime.now().millisecondsSinceEpoch;
          print(currentTimeClick);
          print(now);
          if (currentTimeClick == null || (now - currentTimeClick! > 1000)) {
            currentTimeClick = now;
            onPress?.call();
          }
          // onPress.call();
        },
        child: Text(text, style: styleTextWhite()),
      ),
    );
  }
}
