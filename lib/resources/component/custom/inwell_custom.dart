import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import '../../app_textstyle.dart';

class InkwellCustom extends StatelessWidget {
  Widget? child;
  Color? color;
  double? radius;
  EdgeInsetsGeometry? margin;
  bool? isShadow;
  GestureTapCallback? onTap;

  InkwellCustom({this.child, this.onTap, this.color, this.radius, this.isShadow, this.margin});

  @override
  Widget build(BuildContext context) {
    return _buildMarginOrNot();
  }

  Widget _buildMarginOrNot() {
    if (margin != null) {
      return Container(
        margin: margin,
        child: _buildShadowOrNot(),
      );
    } else {
      return _buildShadowOrNot();
    }
  }


  Widget _buildShadowOrNot() {
    if (isShadow == true) {
      return Container(
        margin: margin,
        decoration: getBoxDecorationShadow(),
        child: _buildRadiusOrNot(),
      );
    } else {
      return _buildRadiusOrNot();
    }
  }

  Widget _buildRadiusOrNot() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.r)),
        child: _buildMaterialInkwell(),
      );
    }
    return _buildMaterialInkwell();
  }


  Widget _buildMaterialInkwell() {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }

  BoxDecoration getBoxDecorationShadow() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2.r,
          blurRadius: 3,
          offset: const Offset(0, 3), // changes position of shadow
        )
      ],
    );
  }
}
