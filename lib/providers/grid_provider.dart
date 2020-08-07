import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/models/hint.dart';
import 'package:chinese_picross/utilities/models/game.dart';
import 'package:chinese_picross/utilities/general_utils/enums.dart';

class GridProvider extends ChangeNotifier {
  GridProvider({@required this.game, this.loadSaveFile=false, this.saveData})
      : hintColumns = List(game.width),
        hintRows = List(game.height),
        gameTiles = List(game.width * game.height),
        correctTiles = game.correctTiles,
        height = game.height,
        width = game.width,
        numberOfCorrect = game.correctTiles.length;

  final Game game;
  final int height;
  final int width;
  final int numberOfCorrect;
  final bool loadSaveFile;
  final List<int> correctTiles;
  final List<List<int>> saveData;

  List hintColumns;
  List hintRows;
  List<ValueNotifier> gameTiles;

  int numberOfMarked = 0;
  ValueNotifier<bool> isFinished = ValueNotifier(false);
  List<int> markedTiles = [];
  List<int> crossedTiles = [];

  void checkTileCorrect(int number) {
    if (!crossedTiles.contains(number) && !markedTiles.contains(number)) {
      if (correctTiles.contains(number)) {
        markedTiles.add(number);
        gameTiles[number].value = TileSort.marked;
        hintRows[determineRow(number)].updateMarkedTiles();
        hintColumns[determineColumn(number)].updateMarkedTiles();
        numberOfMarked++;
        if (numberOfCorrect == numberOfMarked) {
          isFinished.value = true;
        }
      } else {
        toggleCrossed(number);
      }
    }
  }

  void toggleCrossed(int number) {
    if (!markedTiles.contains(number)) {
      if (crossedTiles.contains(number)) {
        crossedTiles.remove(number);
        gameTiles[number].value = TileSort.empty;
      } else {
        crossedTiles.add(number);
        gameTiles[number].value = TileSort.crossed;
      }
    }
  }

  bool isTileCrossed(int number) {
    return crossedTiles.contains(number);
  }

  void initializeTiles() {
    initializeRowHints();
    initializeColumnHints();
    initializeGameTiles();
    if (loadSaveFile) {
      for (int tile in saveData[0]) {
        checkTileCorrect(tile);
      }
      for (int tile in saveData[1]) {
        toggleCrossed(tile);
      }
    }
  }

  void initializeGameTiles() {
    for (int i = 0; i < gameTiles.length; i++) {
      gameTiles[i] = ValueNotifier<TileSort>(TileSort.empty);
    }
  }

  void initializeColumnHints() {
    List tempList;
    int counter;
    for (int i = 0; i < hintColumns.length; i++) {
      tempList =
          correctTiles.where((tileNum) => tileNum ~/ height == i).toList();
      if (tempList.isEmpty) {
        hintColumns[i] = Hint(
            hintNums: [0],
            numberOfCorrectOnes: 0,
            isCompleted: ValueNotifier(true));
      } else {
        counter = 1;
        List<int> hintList = [];
        for (int tile in tempList) {
          if (tempList.contains(tile + 1)) {
            counter++;
          } else {
            hintList.add(counter);
            counter = 1;
          }
        }
        hintColumns[i] = Hint(
            hintNums: hintList,
            numberOfCorrectOnes:
                hintList.reduce((value, element) => value + element),
            isCompleted: ValueNotifier(false));
      }
    }
  }

  void initializeRowHints() {
    List tempList;
    int counter;
    for (int i = 0; i < hintRows.length; i++) {
      tempList =
          correctTiles.where((tileNum) => (tileNum - i) % height == 0).toList();
      if (tempList.isEmpty) {
        hintRows[i] = Hint(
            hintNums: [0],
            numberOfCorrectOnes: 0,
            isCompleted: ValueNotifier(true));
      } else {
        counter = 1;
        List<int> hintList = [];
        for (int tile in tempList) {
          if (tempList.contains(tile + height)) {
            counter++;
          } else {
            hintList.add(counter);
            counter = 1;
          }
        }
        hintRows[i] = Hint(
            hintNums: hintList,
            numberOfCorrectOnes:
                hintList.reduce((value, element) => value + element),
            isCompleted: ValueNotifier(false));
      }
    }
  }

  int determineRow(int number) {
    return number % height;
  }

  int determineColumn(int number) {
    return number ~/ height;
  }

  List<UnmodifiableListView<int>> getMarkedAndCrossedTiles() {
    UnmodifiableListView<int> marked = UnmodifiableListView(markedTiles);
    UnmodifiableListView<int> crossed = UnmodifiableListView(crossedTiles);
    return [marked, crossed];
  }
}
