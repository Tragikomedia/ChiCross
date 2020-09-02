import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/description_card/description_text_tile.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class DescriptionCard extends StatelessWidget {
  final int gameNumber;
  final Color textColor;
  final Color backgroundColor;
  final List examples;
  final description;

  DescriptionCard({@required this.gameNumber, @required this.textColor, @required this.backgroundColor}):
  description = picrossList[gameNumber].description,
  examples = picrossList[gameNumber].examples;

  List<DescriptionTextTile> _getTextTiles(BuildContext context) {
    var loc = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['game'];
    var picrLoc = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['picross'][gameNumber];
    List<DescriptionTextTile> textTiles = [
      DescriptionTextTile(firstText: '${loc['character']}: ', textColor: textColor, backgroundColor: backgroundColor, secondText: description.character, isSecondTextChinese: true,),
      DescriptionTextTile(firstText: '${loc['pronunciation']}: ', secondText: description.chinesePronunciation, textColor: textColor, backgroundColor: backgroundColor),
      DescriptionTextTile(firstText: '${loc['meaning']}: ', secondText: picrLoc[description.meaning], textColor: textColor, backgroundColor: backgroundColor),
      DescriptionTextTile(firstText: '${loc['examples']}:', textColor: textColor, backgroundColor: backgroundColor),
    ];
    for (var example in examples) {
      textTiles.add(DescriptionTextTile(firstText: example.word, isFirstTextChinese: true, secondText: picrLoc[example.meaning], textColor: textColor, backgroundColor: backgroundColor));
    }
    return textTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: _getTextTiles(context),),
    );
  }
}
