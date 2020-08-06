import 'package:flutter/cupertino.dart';

class Game {
  final List<int> correctTiles;
  final int height;
  final int width;
  ValueNotifier<bool> isFinished = ValueNotifier(false);

  Game({@required this.correctTiles, this.height = 10, this.width = 10,});

  void markGameFinished() {
    isFinished.value = true;
  }
}