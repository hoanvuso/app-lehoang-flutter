import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/widgets/image_shimmer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';
import '../../app_colors.dart';
import 'place_holder_error.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingImage extends StatelessWidget {
  LoadingImage({
    required this.imageUrl,
    this.fit = BoxFit.fill,
    this.width = 300,
    this.height = 300,
    this.borderRadius = 0,
    this.errorWidget,
  });

  String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    // return Image.network(
    //   imageUrl ?? '',
    //   fit: fit,
    //   width: width,
    //   height: height,
    // );

    if (!kReleaseMode && Constants.isTestImage) {
      imageUrl = 'https://files.giaoducthoidai.vn/Uploaded/tranghn/2019-05-15/n6-MDJP.jpg';
      // imageUrl: 'https://files.giaoducthoidai.vn/Uploaded/tranghn/2019-05-15/n6-MDJP.jpg',
      // imageUrl: 'https://graph.facebook.com/v3.3/2841154866209707/picture?type=normal',
    }

    if (imageUrl == null || imageUrl?.isEmpty == true) {
      return ClipRRect(borderRadius: BorderRadius.circular(borderRadius), child: ErrorPlaceHolder(width, height));
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: fit,
        width: width,
        height: height,
        placeholder: (context, url) => Container(child: Center(child: Text('Loading...'))),
        errorWidget: (context, url, error) => errorWidget ?? ErrorPlaceHolder(width, height),
      ),
    );
  }
}
