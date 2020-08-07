import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/game_utils/grid_utilities.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GameGrid extends StatelessWidget {
  final int height;
  final int width;

  GameGrid({@required this.height, @required this.width});

  @override
  Widget build(BuildContext context) {
    // TODO Remove this from build, maybe
    Provider.of<GridProvider>(context, listen: false).initializeTiles();
    return StaggeredGridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: width + 3,
      staggeredTiles: stagTiles(width, height),
      children: gridTiles(width, height),
    );
  }
}
