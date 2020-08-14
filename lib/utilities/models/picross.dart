import 'package:flutter/cupertino.dart';
import 'package:chinese_picross/utilities/models/game.dart';
import 'package:chinese_picross/utilities/models/description.dart';
import 'package:chinese_picross/utilities/models/example.dart';

class Picross {
  final int number;
  final Game game;
  final Description description;
  final List<Example> examples;

  Picross({@required this.number, @required this.game, @required this.description, @required this.examples});
}