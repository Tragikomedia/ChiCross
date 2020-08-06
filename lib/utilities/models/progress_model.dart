import 'package:flutter/cupertino.dart';

class ProgressModel {
  final int number;
  final bool isCompleted;
  final String markedTiles;
  final String crossedTiles;

  ProgressModel({@required this.number, @required this.isCompleted, this.markedTiles, this.crossedTiles});

  Map<String, dynamic> toMap() {
    return {
      'number':number,
      'completed': isCompleted ? 1 : 0,
      'marked': markedTiles,
      'crossed': crossedTiles
    };
  }
}