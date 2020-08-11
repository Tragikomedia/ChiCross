import 'package:chinese_picross/utilities/game_utils/dimensions_utilities.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/grid/game_grid.dart';

class GridBox extends StatelessWidget {
  final int height;
  final int width;

  GridBox({@required this.height, @required this.width});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      child: GameGrid(height: height, width: width,),
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: gridHeight(context, width, height),
    );
  }
}
