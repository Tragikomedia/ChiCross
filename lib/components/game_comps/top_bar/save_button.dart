import 'dart:collection';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';

class SaveButton extends StatelessWidget {
  final int gameNumber;

  SaveButton({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(color: ThemeManager.of(context).colorSet.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TopText(text: 'SAVE', color: ThemeManager.of(context).colorSet.primaryColor,),
      ),
      onPressed: () {
      List<UnmodifiableListView<int>> tilesToSave = Provider.of<GridProvider>(context, listen: false).getMarkedAndCrossedTiles();
      Provider.of<ProgressProvider>(context, listen: false).saveLevelProgress(gameNumber, tilesToSave[0], tilesToSave[1]);
    },);
  }
}
