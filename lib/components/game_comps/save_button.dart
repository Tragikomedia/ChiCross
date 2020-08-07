import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';

class SaveButton extends StatelessWidget {
  final int gameNumber;

  SaveButton({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(child: Text('SAVE'),onPressed: () {
      List<UnmodifiableListView<int>> tilesToSave = Provider.of<GridProvider>(context, listen: false).getMarkedAndCrossedTiles();
      Provider.of<ProgressProvider>(context, listen: false).saveLevelProgress(gameNumber, tilesToSave[0], tilesToSave[1]);
    },);
  }
}
