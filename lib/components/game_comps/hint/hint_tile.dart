import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/hint/hint_tile_text.dart';
import 'package:chinese_picross/utilities/models/hint.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/utilities/general_utils/enums.dart';

class HintTile extends StatelessWidget {
  final int number;
  final HintSort sort;
  final int height;
  final int width;

  HintTile({@required this.number, @required this.sort, @required this.height, @required this.width});

  List<Widget> getHintNumbers(int number, BuildContext context) {
    List<Widget> hintList = [];
    Hint hintTile = sort == HintSort.row ? Provider.of<GridProvider>(context, listen: false).hintRows[number] : Provider.of<GridProvider>(context, listen: false).hintColumns[number];
    for(int hint in hintTile.hintNums) {
      hintList.add(HintTileText(hintTile: hintTile, hint: hint, height: height, width: width,));
      if (sort == HintSort.row) {
        hintList.add(SizedBox(width: 2.0,));
      }
    }
    return hintList;
  }

  Border determineHintTileBorder(BuildContext context, int number, HintSort sort, Color borderColor) {
    if (sort == HintSort.column) {
      if (number != width - 1) {
        return Border(top: BorderSide(width: 3.0, color: borderColor),
            right: BorderSide(width: 1.0, color: borderColor),
            left: BorderSide(width: 1.0, color: borderColor),
            bottom: BorderSide(width: 2, color: borderColor));
      } else {
        return Border(top: BorderSide(width: 3.0, color: borderColor),
            left: BorderSide(width: 1.0, color: borderColor),
            bottom: BorderSide(width: 2, color: borderColor));
      }
    } else {
      if (number != height - 1) {
        return Border(top: BorderSide(width: 1.0, color: borderColor),
            right: BorderSide(width: 2, color: borderColor),
            bottom: BorderSide(width: 1.0, color: borderColor));
      } else {
        return Border(top: BorderSide(width: 1.0, color: borderColor),
            right: BorderSide(width: 2, color: borderColor),
            bottom: BorderSide(width: 3.0, color: borderColor));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Container(
          decoration: BoxDecoration(
              color: (number % 2 == 0) ? colorSet.intermediaryColor : colorSet.primaryColor,
              border: determineHintTileBorder(context, number, sort, colorSet.gridNumbersColor)),
          child: (sort == HintSort.row)
              ? Row(mainAxisAlignment: MainAxisAlignment.end,children: getHintNumbers(number, context))
              : Column(mainAxisAlignment: MainAxisAlignment.end,children: getHintNumbers(number, context)),
        );
  }
}
