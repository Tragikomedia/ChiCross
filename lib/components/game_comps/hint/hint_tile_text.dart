import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/models/hint.dart';
import 'package:chinese_picross/utilities/game_utils/dimensions_utilities.dart';

class HintTileText extends StatelessWidget {
  final Hint hintTile;
  final int hint;
  final int height;
  final int width;

  HintTileText({
    @required this.hintTile,
    @required this.hint,
    @required this.height,
    @required this.width
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: hintTile.isCompleted, builder: (context, isCompleted, child) {
      return Text(hint.toString(),
          style: TextStyle(color: isCompleted ? ThemeManager.of(context).colorSet.usedHintColor : ThemeManager.of(context).colorSet.strongestColor,
            fontSize: gameFontSize(context, width, height),
          fontFamily: 'Cyrulik'),);
    });
  }
}