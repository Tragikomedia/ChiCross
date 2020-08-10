import 'package:flutter/cupertino.dart';

class Game {
  final List<int> correctTiles;
  final int height;
  final int width;
  final int gameNumber;

  Game({@required this.correctTiles, @required this.gameNumber, this.height = 10, this.width = 10,});

}