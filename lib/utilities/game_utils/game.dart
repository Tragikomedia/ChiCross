import 'package:flutter/cupertino.dart';

class Game {
  final List<int> correctTiles;
  final int height;
  final int width;
  ValueNotifier<bool> isFinished = ValueNotifier(false);

  Game({@required this.correctTiles, @required this.height, @required this.width});

  void markGameFinished() {
    isFinished.value = true;
  }
}