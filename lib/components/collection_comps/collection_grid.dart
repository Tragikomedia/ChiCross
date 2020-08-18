import 'package:flutter/material.dart';
import 'package:chinese_picross/components/collection_comps/clickable_grid_tile.dart';

class CollectionGrid extends StatelessWidget {
  final List correctTiles;

  CollectionGrid({@required this.correctTiles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: correctTiles.length,
        itemBuilder: (BuildContext context, int index) {
          return ClickableGridTile(
            gameNumber: correctTiles[index],
          );
        });
  }
}
