import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:chinese_picross/utilities/progress_utils/progress_model.dart';
import 'package:chinese_picross/picross_files/games.dart';

class ProgressProvider extends ChangeNotifier {
  Database database;
  List<Map> progressDB;
  

  Future<Database> getDatabase() async {
    var dbDir = await getDatabasesPath();
    var path = p.join(dbDir, 'progress_db.db');
    Future<Database> db = openDatabase(path, version: 1, onOpen: (database) {}, onCreate: (Database database, int version) {
      return database.execute("CREATE TABLE progress(number INTEGER PRIMARY KEY, completed INTEGER, marked TEXT, crossed TEXT)",);
    },);
    return db;
  }

  void deleteDb() async {
  var dbDir = await getDatabasesPath();
  var path = p.join(dbDir, 'progress_db.db');
  deleteDatabase(path);
}

  Future<bool> initializeDatabase() async {
    database = await getDatabase();
    List<Map> maps = await database.query('progress');
    if (maps.isEmpty) {
      for (int i = 0; i < games.length; i++) {
        await database.insert('progress', ProgressModel(number: i, isCompleted: false).toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    progressDB = maps;
    return true;
  }
  void getProgress() {
    print(progressDB);
  }

  void markCompleted(dynamic num) async {
    database.update('progress',{'completed':1},where: "number = $num",);
    progressDB = await database.query('progress');
  }

}

