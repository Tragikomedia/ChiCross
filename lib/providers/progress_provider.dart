import 'dart:async';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:chinese_picross/utilities/models/progress_model.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';

class ProgressProvider extends ChangeNotifier {
  Database database;
  bool firstTimeInit = true;
  List<bool> completenessTracker = List(picrossList.length);

  Future<Database> getDatabase() async {
    var dbDir = await getDatabasesPath();
    var path = p.join(dbDir, 'progress_db.db');
    Future<Database> db = openDatabase(path, version: 1, onOpen: (database) {}, onCreate: (Database database, int version) {
      return database.execute("CREATE TABLE progress(number INTEGER PRIMARY KEY, completed INTEGER, marked TEXT, crossed TEXT, lives INTEGER)",);
    },);
    return db;
  }

  void deleteDb() async {
  var dbDir = await getDatabasesPath();
  var path = p.join(dbDir, 'progress_db.db');
  deleteDatabase(path);
  firstTimeInit = true;
  initializeDatabase();
  notifyListeners();
}
  Future<bool> initializeDatabase() async {
    // FirstTimeInit prevents method realization when notifyListeners is used
    if (firstTimeInit) {
      List<Map> maps;
      try {
        database = await getDatabase();
        maps = await database.query('progress');
      }
      catch (e) {
        print(e);
        return false;
      }
      if (maps.isEmpty) {
        for (int i = 0; i < picrossList.length; i++) {
          await database.insert(
              'progress', ProgressModel(number: i, isCompleted: false).toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
          maps = await database.query('progress');
      }
      for (Map map in maps) {
        completenessTracker[map['number']] = map['completed'] == 1;
      }
      if (completenessTracker.contains(null)) {
        incorporateAddedLevels();
      }
      firstTimeInit = false;
    }
    notifyListeners();
    return true;
  }

  void incorporateAddedLevels() async {
    int start = completenessTracker.indexOf(null);
    for (int i = start; i < completenessTracker.length; i++) {
      completenessTracker[i] = false;
      await database.insert(
          'progress', ProgressModel(number: i, isCompleted: false).toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  void saveSynchronizedData() async {
    for (int index = 0; index < completenessTracker.length; index++) {
     if (completenessTracker[index]) {
       markCompleted(index);
     }
      }
    }

  void markCompleted(int num) async {
    await database.update('progress',{'completed':1},where: "number = $num",);
    completenessTracker[num] = true;
    notifyListeners();
  }

  void saveLevelProgress(int num, int lives, UnmodifiableListView markedTiles, UnmodifiableListView crossedTiles) async {
    String marked = markedTiles.isNotEmpty ? markedTiles.join(',') : null;
    String crossed = crossedTiles.isNotEmpty ? crossedTiles.join(',') : null;
    await database.update('progress',{'marked':marked, 'crossed':crossed, 'lives':lives},where: "number = $num",);
  }

  void eraseLevelProgress(int num) async {
    await database.update('progress',{'marked':null, 'crossed':null, 'lives':null},where: "number = $num",);
  }

  Future<List> retrieveLevelProgress(int num) async {
    List<Map> results = await database.rawQuery(
        'SELECT marked, crossed, lives FROM progress WHERE number = $num');
    if (results.isNotEmpty && (results[0]['marked'] != null || results[0]['crossed'] != null)) {
      List saveData = [[], []];
      try {
        results[0]['marked'].split(',').forEach((element) =>
            saveData[0].add(int.parse(element)));
      } catch (err) {
      }
      try {
        results[0]['crossed'].split(',').forEach((element) =>
            saveData[1].add(int.parse(element)));
      } catch (err) {
      }
      saveData.add(results[0]['lives']);
      return saveData;
    }
    return null;
  }

}

