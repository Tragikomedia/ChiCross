import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/components/game_comps/grid/cross_icon.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/enums.dart';
import 'package:provider/provider.dart';


class GameTile extends StatelessWidget {
  final int number;
  final int height;
  final int width;

  GameTile({@required this.number, @required this.height, @required this.width});

  Color _determineTileColor(BuildContext context, TileSort tileSort, int number) {
    var colorSet = ThemeManager.of(context).colorSet;
    if (tileSort == TileSort.marked) {
      return colorSet.secondaryColor;
    }
    return (number ~/ height) % 2 == 0 ? colorSet.primaryColor : colorSet.intermediaryColor;
  }

  Border _determineTileBorder(BuildContext context) {
    int tileVerticalPosition = number % height; 
    int tileHorizontalPosition = number ~/ width;
    var thickBorderColor = ThemeManager.of(context).colorSet.strongestColor;
    return Border(
      top: (tileVerticalPosition == height/2) ? BorderSide(color: thickBorderColor, width: 1.5) : BorderSide(color: Colors.black, width: 0.5),
      right: (tileHorizontalPosition == width/2 - 1) ? BorderSide(color: thickBorderColor, width: 1.5) : BorderSide(color: Colors.black, width: 0.5),
      left: (tileHorizontalPosition == width/2) ? BorderSide(color: thickBorderColor, width: 1.5) : BorderSide(color: Colors.black, width: 0.5),
      bottom: (tileVerticalPosition == height/2 - 1 || tileVerticalPosition == height - 1) ? BorderSide(color: thickBorderColor, width: (tileVerticalPosition == height/2 - 1) ? 1.5 : 3.0) : BorderSide(color: Colors.black, width: 0.5)
    );
  }

  void saveData(BuildContext context) {
    if (Provider.of<PreferencesProvider>(context,listen: false).autosaveOn){
      List<UnmodifiableListView<int>> tilesToSave = Provider.of<GridProvider>(context, listen: false).getMarkedAndCrossedTiles();
      Provider.of<ProgressProvider>(context, listen: false).saveLevelProgress(Provider.of<GridProvider>(context, listen: false).game.gameNumber, tilesToSave[0], tilesToSave[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    GridProvider gridProvider = Provider.of<GridProvider>(context, listen: false);
      return GestureDetector(
        onTap: () {
          gridProvider.checkIfTileIsCorrect(number);
          saveData(context);
        },
        onLongPress: () {
          gridProvider.toggleCrossed(number);
          saveData(context);
          },
        onDoubleTap: () {
          gridProvider.toggleCrossed(number);
          saveData(context);
          },
        child: ValueListenableBuilder(valueListenable: gridProvider.gameTiles[number],
          builder: (context, tileSort, child) {
          return Container(
          decoration: BoxDecoration(
              color: _determineTileColor(context, tileSort, number),
              border: _determineTileBorder(context)),
          child: tileSort == TileSort.crossed ? CrossIcon(height: height, width: width,) : SizedBox.shrink(),
        );}),
      );
  }
}