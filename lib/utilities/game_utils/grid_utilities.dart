import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:chinese_picross/components/game_comps/hint_tile.dart';
import 'package:chinese_picross/components/game_comps/game_tile.dart';
import 'package:chinese_picross/components/game_comps/grid_corner_box.dart';
import 'package:chinese_picross/utilities/general_utils/enums.dart';

List<StaggeredTile> stagTiles(int width, int height) {
  List<StaggeredTile> newList = [];
  newList.add(StaggeredTile.count(3, 2));
  for (int i = 0; i < height; i++) {
    // Row hint tiles
    newList.add(StaggeredTile.count(1, 2));
  }
  for (int j = 0; j < width; j++) {
    // Column hint tiles
    newList.add(StaggeredTile.count(3, 1));
    for (int m = 0; m < height; m++) {
      // Actual game tiles
      newList.add(StaggeredTile.count(1, 1));
    }
  }
  return newList;
}

List<Widget> gridTiles(int width, int height) {
  List<Widget> newList = [];
  // Top left box
  newList.add(GridCornerBox());
  // Row hint tiles
  for (int i = 0; i < height; i++) {
    newList.add(HintTile(
      number: i,
      sort: HintSort.row,
      width: width,
      height: height,
    ));
  }
  // Column hint tiles
  for (int j = 0; j < width; j++) {
    newList.add(HintTile(
      number: j,
      sort: HintSort.column,
      width: width,
      height: height,
    ));
    // Game tiles
    for (int m = 0; m < height; m++) {
      newList.add(GameTile(
        number: int.parse('$j$m'),
        width: width,
        height: height,
      ));
    }
  }
  return newList;
}