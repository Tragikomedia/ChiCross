import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

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
            child: TopText(text: '${gameNumber + 1}. ${localization[Provider.of<PreferencesProvider>(context, listen: false).language]['picross'][gameNumber][picrossList[gameNumber].description.meaning]}',
              color: textColor,),
          ),);
  }
}
