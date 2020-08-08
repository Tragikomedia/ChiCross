import 'package:flutter/material.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/cross_icon.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/utilities/general_utils/enums.dart';

class GameTile extends StatelessWidget {
  final int number;
  final int height;
  final int width;

  GameTile({@required this.number, @required this.height, @required this.width});

  Color determineTileColor(BuildContext context, TileSort tileSort, int number) {
    if (tileSort == TileSort.marked) {
      return Theme.of(context).accentColor;
    }
    return (number ~/ height) % 2 == 0 ? Theme.of(context).primaryColor : Theme.of(context).selectedRowColor;
  }

  @override
  Widget build(BuildContext context) {
    GridProvider gridProvider = Provider.of<GridProvider>(context, listen: false);
      return GestureDetector(
        onTap: () {
          gridProvider.checkTileCorrect(number);
        },
        onLongPress: () {
          gridProvider.toggleCrossed(number);
        },
        onDoubleTap: () {
          gridProvider.toggleCrossed(number);
        },
        child: ValueListenableBuilder(valueListenable: gridProvider.gameTiles[number],
          builder: (context, tileSort, child) {
          return Container(
          decoration: BoxDecoration(
              color: determineTileColor(context, tileSort, number),
              border: Border.all(color: Colors.black, width: 0.5)),
          child: tileSort == TileSort.crossed ? CrossIcon(height: height, width: width,) : SizedBox.shrink(),
        );}),
      );
  }
}