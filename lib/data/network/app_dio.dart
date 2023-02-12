import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants.dart';
// import 'package:ua_client_hints/ua_client_hints.dart';


// ignore: prefer_mixin
class AppDio with DioMixin implements Dio {
  AppDio._() {
    Map<String, String> headers = {
      "cache-control": "no-cache",
      "Accept": "application/json",
    };

    options = BaseOptions(
      baseUrl: Constants.endpoint,
      contentType: 'application/json',
      headers: headers,
      connectTimeout: 50000,
      sendTimeout: 50000,
      receiveTimeout: 50000,
    );
    //
    this.options = options;
    // interceptors.add(InterceptorsWrapper(onRequest: (options) async {
    //   options.headers.addAll(await userAgentClientHintsHeader());
    // }));

    // API Cache
    // interceptors.add(DioCacheManager(
    //   CacheConfig(
    //     baseUrl: Constants.of().endpoint,
    //   ),
    // ).interceptor);

    // Firebase Performance
    // interceptors.add(DioFirebasePerformanceInterceptor());

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
