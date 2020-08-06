import 'package:flutter/cupertino.dart';
import 'package:chinese_picross/utilities/models/game.dart';
import 'package:chinese_picross/utilities/models/description.dart';

class Picross {
  final int number;
  final Game game;
  final Description description;

  Picross({@required this.number, @required this.game, @required this.description});
}