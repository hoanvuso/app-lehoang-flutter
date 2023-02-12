import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/ui/master/master_page_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class IconButtonClose extends StatelessWidget {
  final VoidCallback? onPress;
  final Color? color;
  final double? size;

  IconButtonClose({this.onPress, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 35.h,
      height: size ?? 35.h,
      child: RawMaterialButton(
        onPressed: onPress ??
            () {
              Navigator.maybePop(context);
              context.read(masterPageViewModel).backPageFromBackStack();
            },
        elevation: 2.0,
        child: Icon(
          Icons.close,
          size: size == null ? 30.h : 6 / 7 * size!,
          color: color ?? Colors.white,
        ),
        shape: const CircleBorder(),
      ),
    );
  }
}
