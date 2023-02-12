import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

Future<File> openImagePickerGallery() async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  return File(pickedFile.path);
}

Future<File> openImagePickerCamera() async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
  return File(pickedFile.path);
}

void openShareText(String? text) {
  Share.share(text ?? '');
}

void openPhoneDial(String? phone) {
  launch("tel://$phone");
}

void openEmail(String? email) {
  launch('mailto:$email');
}

void openZalo(String? phone) {
  launch('http://zalo.me/$phone');
}

void openFacebook(String? facebook) {
  launch(facebook ?? 'https://www.facebook.com/');
}

void openWebLink(String? link) {
  launch(link ?? 'https://www.google.com/');
}
