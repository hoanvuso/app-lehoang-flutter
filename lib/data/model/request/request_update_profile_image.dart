import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';

class RequestUpdateProfileImage {
  File? image;

  RequestUpdateProfileImage(this.image);

  Future<FormData> toFormData() async {
    var fileName = image?.path.split('/').last ?? "";
    var multipart = image == null ? null : await MultipartFile.fromFile(image?.path, filename: fileName);

    return FormData.fromMap({
      "image": multipart,
    });
  }
}
