import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_lehoang_extracare/data/model/base/app_error.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';

import 'event_once.dart';

class BaseLoadingChangeNotifier extends ChangeNotifier {
  bool isLoading = false;
  EventOnce<AppError>? error;

  Future<dynamic> doWithLoading(Future<dynamic> future) {
    return Future.microtask(_toLoading).then((_) => future).whenComplete(_toIdle);
  }

  Future<dynamic> doWithLoadingMulti(List<Future<dynamic>> futures) {
    // Trả về responseList của requestList theo thứ tự
    return Future.microtask(_toLoading).then((_) async {
      var value = [];
      var results = await Future.wait(futures);
      for (var response in results) {
        value.add(response);
      }
      return value;
    }).whenComplete(_toIdle);
  }

  void _toLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  void _toIdle() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }

  void pushError(AppError? e) {
    error = EventOnce(e);
    if (e != null) {
      notifyListeners();
    }
  }

  //pass T = bool if no need result (must be bool, not bool?)
  Future<T> handleResultAPI<T>(
    Future<Result> apiCall, {
    // Function(T? value)? onSuccess,
    VoidCallback? onError,
    bool isShowError = true,
    bool isShowLoading = false,
  }) {
    Completer<T> completer = Completer();
    Completer<bool?> completerNoResult = Completer();

    if (isShowLoading) {
      doWithLoading(apiCall.then((value) {
        try {
          final result = value.dataOrThrow;
          // onSuccess?.call(result as T);

          if (T != bool) completer.complete(result);
          completerNoResult.complete(true);
        } on AppError catch (e) {
          if (isShowError) pushError(e);
          onError?.call();
          completer.complete(null);
          completerNoResult.complete(false);
        }
      }));
    } else {
      apiCall.then((value) {
        try {
          final result = value.dataOrThrow;
          // onSuccess?.call(result as T);

          if (T != bool) completer.complete(result);
          completerNoResult.complete(true);
        } on AppError catch (e) {
          if (isShowError) pushError(e);
          onError?.call();

          completer.complete(null);
          completerNoResult.complete(false);
        }
      });
    }

    if (T == bool) {
      return completerNoResult.future as Future<T>;
    } else {
      return completer.future;
    }
  }
}
