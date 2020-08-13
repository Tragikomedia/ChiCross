import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/components/selection_comps/leading_character.dart';
import 'package:chinese_picross/components/selection_comps/selection_tile_text.dart';

class SelectionListTile extends StatelessWidget {
  final int gameNumber;
  final bool isCompleted;
  final String character;
  final String pronunciation;
  final String meaning;

  SelectionListTile({@required this.gameNumber, @required this.isCompleted}):
  character = isCompleted ? picrossList[gameNumber].description.character : '??',
  pronunciation = isCompleted ? picrossList[gameNumber].description.chinesePronunciation : '???',
  meaning = isCompleted ? picrossList[gameNumber].description.meaning : '???';

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Card(
      color: isCompleted ? colorSet.secondaryColor : colorSet.strongestColor,
      child: ListTile(
        leading: LeadingCharacter(
          character: character,
          characterColor: colorSet.secondaryColor,
          backgroundColor: colorSet.primaryColor,),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SelectionTileText(text: (gameNumber + 1).toString(), color: colorSet.primaryColor,),
          SelectionTileText(text: meaning, color: colorSet.primaryColor,)
        ],),
      ),);
  }
}
