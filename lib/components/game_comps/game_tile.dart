import 'package:flutter/material.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/cross_icon.dart';
import 'package:provider/provider.dart';

class GameTile extends StatelessWidget {
  final int number;
  final int height;
  final int width;

  GameTile({@required this.number, @required this.height, @required this.width});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, GridProvider gameProvider, child) {
      return GestureDetector(
        onTap: () {
          gameProvider.checkTileCorrect(number);
        },
        onLongPress: () {
          gameProvider.toggleCrossed(number);
        },
        onDoubleTap: () {
          gameProvider.toggleCrossed(number);
        },
        child: Container(
          decoration: BoxDecoration(
              color: gameProvider.determineTileColor(number),
              border: Border.all(color: Colors.black, width: 0.5)),
          child: gameProvider.isTileCrossed(number) ? CrossIcon(height: height, width: width,) : SizedBox.shrink(),
        ),
      );
    });
  }
}