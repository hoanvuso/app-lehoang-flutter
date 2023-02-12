// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dicar/resources/app_colors.dart';
// import 'package:flutter_dicar/resources/app_textstyle.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class ButtonGradient extends StatelessWidget {
//   final String text;
//   final VoidCallback onPress;
//   final double height;
//   final double width;
//
//   ButtonGradient({Key key, this.text, this.onPress, this.height, this.width}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: onPress,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
//       padding: const EdgeInsets.all(0.0),
//       child: Ink(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               colors: [colorStartButtonEnable, colorEndButtonEnable],
//               begin: FractionalOffset(0.0, 0.0),
//               end: FractionalOffset(0.8, 0.0),
//               stops: [0.0, 1.0],
//               tileMode: TileMode.clamp),
//           borderRadius: BorderRadius.all(Radius.circular(80.0)),
//         ),
//         child: Container(
//           height: height ?? 47,
//           width: width ?? double.infinity,
//           alignment: Alignment.center,
//           child: Text(
//             text,
//             style: styleTextWhiteBold(16),
//             textAlign: TextAlign.center,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ),
//     );
//   }
// }
