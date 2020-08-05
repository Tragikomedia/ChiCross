import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/hint_tile_text.dart';
import 'package:chinese_picross/utilities/game_utils/hint.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:provider/provider.dart';

class HintTile extends StatelessWidget {
  final int number;
  final HintSort sort;
  final int height;
  final int width;

  HintTile({@required this.number, @required this.sort, @required this.height, @required this.width});

  List<HintTileText> getHintNumbers(int number, BuildContext context) {
    List<HintTileText> hintList = [];
    Hint hintTile = sort == HintSort.row ? Provider.of<GridProvider>(context, listen: false).hintRows[number] : Provider.of<GridProvider>(context, listen: false).hintColumns[number];
    for(int hint in hintTile.hintNums) {
      hintList.add(HintTileText(hintTile: hintTile, hint: hint, height: height, width: width,));
    }
    return hintList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              color: (number % 2 == 0) ? Colors.orangeAccent : Colors.yellow,
              border: Border.all(color: Colors.black, width: 1.0)),
          child: (sort == HintSort.row)
              ? Row(mainAxisAlignment: MainAxisAlignment.end,children: getHintNumbers(number, context))
              : Column(mainAxisAlignment: MainAxisAlignment.end,children: getHintNumbers(number, context)),
        );

  }
}
