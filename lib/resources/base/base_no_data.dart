import 'package:flutter/cupertino.dart';

import '../app_textstyle.dart';

class ErrorNoData extends StatelessWidget {
  final VoidCallback? _onRetry;

  ErrorNoData({VoidCallback? onRetry}) : _onRetry = onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      // Assets.images.imgNoData1.image(width: 250, height: 250, color: colorPrimaryLight),
      Text(
        'Dữ liệu trống',
        style: styleTextBlack(),
      )
    ]));
    //
    // return Container(
    //   alignment: Alignment.topCenter,
    //   // height: double.infinity,
    //   // width: double.infinity,
    //   child: QuickSup.error(
    //     wrapImageInCircle: false,
    //     image: Assets.images.imgNoData.image(height: 200),
    //     title: 'Dữ liệu trống',
    //   ),
    // );
  }
}
