import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';

class ErrorPlaceHolder extends StatelessWidget {
  final double width;
  final double height;

  ErrorPlaceHolder(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.image_not_supported_outlined, color: colorGrey, size: height / 3),
          _buildImageNotFound()
        ],
      ),
    );
  }

  Widget _buildImageNotFound() {
    if (height >= 80.h) {
      return Column(
        children: [
          SizedBox(height: 5.h),
          Text('Image Not Found', style: TextStyle(color: colorGrey, fontSize: 12.sp), textAlign: TextAlign.center)
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
