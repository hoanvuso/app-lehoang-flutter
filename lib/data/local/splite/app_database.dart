import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'database_provider.dart';

class AppDatabase {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "AppDatabase.db";

  // Increment this version when you need to change the schema.
  static final _databaseVersion = 2;

  static AppDatabase getInstance() => AppDatabase._();

  AppDatabase._();

  // Only allow a single open connection to the database.
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
    // onUpgrade: _onUpgrade);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    // await db.execute(tableNote);
    // await db.execute(tableNoteImage);
    // await db.execute(tableNoteTag);
    // await db.execute(tableRelationShipNoteAndNoteTag);
    // await db.execute(tableCartJson);
  }

  static const tableNote = """
  CREATE TABLE IF NOT EXISTS ${DatabaseProvider.TABLE_NOTE} (
        timeAdd BIGINT PRIMARY KEY,
        title TEXT,
        content TEXT,
        type INTEGER,
        priority INTEGER,
        imageBase64 TEXT
      );""";

  static const tableNoteImage = """
  CREATE TABLE IF NOT EXISTS ${DatabaseProvider.TABLE_NOTE_IMAGE} (
        idNote BIGINT,
        imageBase64 TEXT
      );""";

  static const tableNoteTag = """
  CREATE TABLE IF NOT EXISTS ${DatabaseProvider.TABLE_NOTE_TAG} (
        timeAdd BIGINT PRIMARY KEY,
        name TEXT
      );""";

  static const tableRelationShipNoteAndNoteTag = """
  CREATE TABLE IF NOT EXISTS ${DatabaseProvider.TABLE_NOTE_RELA_NOTE_TAG} (
        idNote BIGINT,
        idNoteTag BIGINT,
        nameTag TEXT
      );""";

  static const tableCartJson = """
  CREATE TABLE IF NOT EXISTS ${DatabaseProvider.TABLE_CART_JSON} (
        json TEXT
      );""";

// static const tableMaxDistanceHour = """
// CREATE TABLE IF NOT EXISTS ${DatabaseProvider.TABLE_MAX_DISTANCE_HOUR} (
//       time TEXT PRIMARY KEY,
//       text TEXT
//     );""";
//
// static const tableWaitingTimePrice = """
// CREATE TABLE IF NOT EXISTS ${DatabaseProvider.TABLE_WAITING_TIME_PRICE} (
//       id INTEGER PRIMARY KEY,
//       time INTEGER,
//       amount TEXT
//     );""";

// static const tableHomeServiceCategory = """
// CREATE TABLE IF NOT EXISTS tableHomeServiceCategory (
//       id INTEGER PRIMARY KEY,
//       json TEXT
//     );""";
//
// static const tableHomeProduct = """
// CREATE TABLE IF NOT EXISTS tableHomeProduct (
//       id INTEGER PRIMARY KEY,
//       json TEXT
//     );""";

// void _onUpgrade(Database db, int oldVersion, int newVersion) {
//   if (oldVersion < newVersion) {
//     db.execute("ALTER TABLE tableProvince ADD COLUMN city_id TEXT;");
//     db.execute("ALTER TABLE tableProvince ADD COLUMN district_id TEXT;");
//   }
// }
}
