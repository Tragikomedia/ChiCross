import 'package:flutter/cupertino.dart';

enum HintSort { row, column }

class Hint {
  final List<int> hintNums;
  final int numberOfCorrectOnes;
  int numberOfMarkedTiles = 0;
  ValueNotifier<bool> isCompleted;
  Hint({this.hintNums, this.numberOfCorrectOnes, this.isCompleted});

  void updateMarkedTiles() {
    numberOfMarkedTiles++;
    if (numberOfCorrectOnes == numberOfMarkedTiles) {
      markCompleted();
    }
  }
  void markCompleted() {
    isCompleted = ValueNotifier(true);
  }
}