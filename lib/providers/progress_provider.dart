import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:chinese_picross/utilities/models/progress_model.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';

class ProgressProvider extends ChangeNotifier {
  Database database;
  List<bool> completenessTracker = List(picrossList.length);

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
      for (int i = 0; i < picrossList.length; i++) {
        await database.insert('progress', ProgressModel(number: i, isCompleted: false).toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    for (Map map in maps) {
      completenessTracker[map['number']] = map['completed'] == 1;
    }
    return true;
  }

  void markCompleted(int num) async {
    database.update('progress',{'completed':1},where: "number = $num",);
    completenessTracker[num] = true;
    notifyListeners();
  }

}

