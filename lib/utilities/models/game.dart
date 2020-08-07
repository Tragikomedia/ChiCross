import 'package:flutter/cupertino.dart';

class Game {
  final List<int> correctTiles;
  final int height;
  final int width;

  Game({@required this.correctTiles, this.height = 10, this.width = 10,});

}