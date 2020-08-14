import 'package:flutter/material.dart';
import 'package:chinese_picross/components/selection_comps/start_game_selection.dart';
import 'package:chinese_picross/components/selection_comps/selection_popup_text.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class SelectionPopup extends StatelessWidget {
  final int gameNumber;

  SelectionPopup({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return SimpleDialog(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),),
      backgroundColor: colorSet.primaryColor,
      title: SelectionPopupText(gameNumber: gameNumber, color: colorSet.secondaryColor,),
      children: [Padding(
          padding: EdgeInsets.all(8.0),
          child: StartGameSelection(gameNumber: gameNumber, textColor: colorSet.intermediaryColor, backgroundColor: colorSet.secondaryColor,)
          ),]
        );
  }
}

