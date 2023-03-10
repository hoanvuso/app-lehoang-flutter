import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'base_response.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

class AppError {
  String? message;
  AppErrorType? type;

  AppError(Exception error) {
    if (error is DioError) {
      debugPrint('AppError(DioError): '
          'type is ${error.type}, message is ${error.message}');
      message = error.message;
      switch (error.type) {
        case DioErrorType.DEFAULT:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = AppErrorType.network;
          } else {
            type = AppErrorType.unknown;
          }
          break;
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          type = AppErrorType.timeout;
          break;
        case DioErrorType.SEND_TIMEOUT:
          type = AppErrorType.network;
          break;
        case DioErrorType.RESPONSE:
          try {
            final json = BaseResponse.fromJson(error.response?.data, (obj) {});
            message = json.msg;
          } on Exception catch (e) {
            log(e.toString());
          }
          switch (error.response.statusCode) {
            case HttpStatus.badRequest: // 400
              type = AppErrorType.badRequest;
              break;
            case HttpStatus.unauthorized: // 401
              type = AppErrorType.unauthorized;
              break;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
            case HttpStatus.gatewayTimeout: // 504
              type = AppErrorType.server;
              break;
            default:
              type = AppErrorType.unknown;
              break;
          }

          break;
        case DioErrorType.CANCEL:
          type = AppErrorType.cancel;
          break;
        default:
          type = AppErrorType.unknown;
      }
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      message = 'AppError: $error';
    }
  }
}

// class AppError {
//   String? message;
//   AppErrorType? type;
//
//   AppError(Exception error) {
//     if (error is DioError) {
//       debugPrint('AppError(DioError): '
//           'type is ${error.type}, message is ${error.message}');
//       message = error.message;
//       switch (error.type) {
//         case DioErrorType.other:
//           if (error.error is SocketException) {
//             type = AppErrorType.network;
//           } else {
//             type = AppErrorType.unknown;
//           }
//           break;
//         case DioErrorType.connectTimeout:
//           type = AppErrorType.timeout;
//           break;
//         case DioErrorType.receiveTimeout:
//           type = AppErrorType.timeout;
//           break;
//         case DioErrorType.sendTimeout:
//           type = AppErrorType.network;
//           break;
//         case DioErrorType.response:
//           try {
//             final json = BaseResponse.fromJson(error.response?.data, (obj) {});
//             message = json.msg;
//           } catch (e) {
//             log(e.toString());
//           }
//           switch (error.response?.statusCode) {
//             case HttpStatus.badRequest: // 400
//               type = AppErrorType.badRequest;
//               break;
//             case HttpStatus.unauthorized: // 401
//               type = AppErrorType.unauthorized;
//               break;
//             case HttpStatus.internalServerError: // 500
//             case HttpStatus.badGateway: // 502
//             case HttpStatus.serviceUnavailable: // 503
//             case HttpStatus.gatewayTimeout: // 504
//               type = AppErrorType.server;
//               break;
//             default:
//               type = AppErrorType.unknown;
//               break;
//           }
//
//           break;
//         case DioErrorType.cancel:
//           type = AppErrorType.cancel;
//           break;
//         default:
//           type = AppErrorType.unknown;
//       }
//     } else {
//       debugPrint('AppError(UnKnown): $error');
//       type = AppErrorType.unknown;
//       message = 'AppError: $error';
//     }
//   }
// }
