import 'dart:convert';


import 'app_database.dart';

class DatabaseProvider {
  static const String TABLE_NOTE = 'tableNote';
  static const String TABLE_NOTE_IMAGE = 'tableNoteImage';
  static const String TABLE_NOTE_TAG = 'tableNoteTag';
  static const String TABLE_NOTE_RELA_NOTE_TAG = 'tableNoteRelaNoteTag';

  static const String TABLE_CART_JSON = 'TABLE_CART_JSON';

  DatabaseProvider(this._appDatabase);

  final AppDatabase _appDatabase;
}
