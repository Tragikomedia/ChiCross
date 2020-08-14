import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/finished_game/description_text_tile.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';

class DescriptionCard extends StatelessWidget {
  final int gameNumber;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final List examples;
  final description;

  DescriptionCard({@required this.gameNumber, @required this.textColor, @required this.borderColor, @required this.backgroundColor}):
  description = picrossList[gameNumber].description,
  examples = picrossList[gameNumber].examples;

  List<DescriptionTextTile> _getTextTiles() {
    List<DescriptionTextTile> textTiles = [
      DescriptionTextTile(firstText: 'Character: ', textColor: textColor, secondText: description.character, isSecondTextChinese: true,),
      DescriptionTextTile(firstText: 'Pronunciation: ', secondText: description.chinesePronunciation, textColor: textColor,),
      DescriptionTextTile(firstText: 'Meaning: ', secondText: description.meaning, textColor: textColor,),
      DescriptionTextTile(firstText: 'Examples:', textColor: textColor,),
    ];
    for (var example in examples) {
      textTiles.add(DescriptionTextTile(firstText: example.word, isFirstTextChinese: true, secondText: example.meaning, textColor: textColor,));
    }
    return textTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Card(color: borderColor,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          color: backgroundColor,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: _getTextTiles(),),
        ),
      ),);
  }
}
