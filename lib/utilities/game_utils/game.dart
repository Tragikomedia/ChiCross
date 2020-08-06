import 'package:flutter/cupertino.dart';

class Game {
  final List<int> correctTiles;
  final int height;
  final int width;
  final int gameNumber;
  ValueNotifier<bool> isFinished = ValueNotifier(false);

  Game({@required this.correctTiles, @required this.height, @required this.width, @required this.gameNumber});

  void markGameFinished() {
    isFinished.value = true;
  }
}