import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_textstyle.dart';

class DialogSuccess extends StatelessWidget {
  final String title;
  final String? content;

  DialogSuccess({required this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        height: 250.0,
        // width: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ClipOval(
            //     child: Container(
            //         color: colorPrimaryLight,
            //         width: 65,
            //         height: 65,
            //         child: const Icon(Icons.done, color: colorBackgroundDark, size: 55))),
            const SizedBox(height: 20),
            Text(
              title,
              style: styleTextTitleWhite,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            content == null
                ? const SizedBox()
                : Text(
                    content!,
                    style: styleTextWhite(),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
