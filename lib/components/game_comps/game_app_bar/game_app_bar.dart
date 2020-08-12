import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';

class GameAppBar extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final int gameNumber;

  GameAppBar({@required this.textColor, @required this.backgroundColor, @required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: backgroundColor,
          iconTheme: IconThemeData(color: textColor),
          title: Align(alignment: Alignment.centerRight,
            child: TopText(text: '${gameNumber + 1}. ${picrossList[gameNumber].description.meaning}',
              color: textColor,),
          ),);
  }
}
