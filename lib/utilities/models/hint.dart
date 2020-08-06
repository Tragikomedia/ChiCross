import 'package:flutter/cupertino.dart';

class Hint {
  final List<int> hintNums;
  final int numberOfCorrectOnes;
  int numberOfMarkedTiles = 0;
  ValueNotifier<bool> isCompleted;
  Hint({@required this.hintNums, @required this.numberOfCorrectOnes, @required this.isCompleted});

  void updateMarkedTiles() {
    numberOfMarkedTiles++;
    if (numberOfCorrectOnes == numberOfMarkedTiles) {
      markCompleted();
    }
  }
  void markCompleted() {
    isCompleted.value = true;
  }
}