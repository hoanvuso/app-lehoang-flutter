import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/component/image/shimmer_loading_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileUpdateImage extends StatelessWidget {
  final File? imageLocal;
  final String? imageUrl;

  ProfileUpdateImage({this.imageLocal, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      // borderRadius: BorderRadius.circular(60.r),
      child: Container(
          child: Stack(
            children: [
              ShimmerLoadingImage(
                height: 40.h,
                width: 40.h,
                fit: BoxFit.cover,
                imageUrl: imageUrl ?? '',
              ),
              imageLocal == null
                  ? const SizedBox()
                  : Container(
                color: Colors.white,
                child: Image.file(
                  imageLocal!,
                  height: 40.h,
                  width: 40.h,
                ),
              ),
            ],
          )),
    );
  }
}
