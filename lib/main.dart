import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  HttpOverrides.global = MyHttpOverrides();
  // SharedPreferences.setMockInitialValues({});
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //
  // if (Platform.isAndroid) {
  //   await Firebase.initializeApp();
  //   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // } else {
  //
  // }

  runZonedGuarded(() {
    runApp(ProviderScope(
      child: AppSplash(),
    ));
  }, (error, stackTrace) {
    log(error.toString());
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //must have this empty function
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
