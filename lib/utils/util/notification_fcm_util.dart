import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void setupFCMForeground(BuildContext context, Function(String) openNotificationPayload) async {
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //Android setting
  const initializationSettingsAndroid = AndroidInitializationSettings('app_logo');

  //IOS setting
  final initializationSettingsIOS =
  IOSInitializationSettings(onDidReceiveLocalNotification: (int id, String title, String body, String payload) {
    return onDidReceiveLocalNotificationForegroundIOS(context, id, title, body, payload, openNotificationPayload);
  });

  //Mac Setting
  final initializationSettingsMacOS = const MacOSInitializationSettings();

  final initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (payload) async {
      openNotificationPayload.call(payload);
    },
  );

  const platformChannelSpecifics = NotificationDetails(
    android: AndroidNotificationDetails(Constants.CHANNEL_ID, Constants.CHANNEL_NAME, Constants.CHANNEL_DESCRIPTION,
        importance: Importance.max, priority: Priority.high, showWhen: false),
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('FirebaseMessaging.onMessage !!!!!!!!!!!!!!');
    print('FirebaseMessaging.onMessage data: ${message.data}');

    if (message.notification != null) {
      print('FirebaseMessaging.onMessage also contained a notification: ${message.notification}');
    }

    final data = message.data;

    int? id;
    String? title, body;
    try {
      id = data['id'] as int;
      title = data['title'];
      body = data['body'];
    } on Error catch (e) {} on Exception catch (e) {}

    if (id == null) id = 0;
    if (title == null) title = 'Thông báo';
    if (body == null) body = 'Nội dung thông báo';

    await flutterLocalNotificationsPlugin.show(id, title, body, platformChannelSpecifics, payload: json.encode(data));
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('FirebaseMessaging.onMessageOpenedApp !!!!!!!!!!!!!!');
    print('FirebaseMessaging.onMessageOpenedApp data: ${message.data}');

    if (message.notification != null) {
      print('FirebaseMessaging.onMessageOpenedApp also contained a notification: ${message.notification}');
    }
  });
}

Future onDidReceiveLocalNotificationForegroundIOS(BuildContext context, int id, String title, String body,
    String payload, Function(String) openNotificationPayload) async {
  // IOS default doesn't show notification when app in foreground
  // setting this to show notification
  showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            openNotificationPayload.call(payload);
          },
        )
      ],
    ),
  );
}
