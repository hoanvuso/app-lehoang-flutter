import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  pubspec.yaml:
  geolocator: ^7.0.1                    # Get user 's location
 */
//
// Future<Position> getCurrentLocation(BuildContext context, void Function(Position? p) onSuccess,) async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     showAlertDialog(context: context, message: 'Location services are not enabled');
//     return Future.value(null);
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       showAlertDialog(context: context, message: 'Ứng dụng cần quyền truy cập vị trí để tiếp tục');
//       return Future.value(null);
//     }
//
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       showAlertDialog(context: context, message: 'Ứng dụng cần quyền truy cập vị trí để tiếp tục');
//       return Future.value(null);
//     }
//   }
//
//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   final position = await Geolocator.getCurrentPosition();
//   onSuccess.call(position);
//   return position;
// }
