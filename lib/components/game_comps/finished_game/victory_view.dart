import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/character_tile.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/components/game_comps/finished_game/description_card.dart';

class VictoryView extends StatelessWidget {
  final int gameNumber;

  VictoryView({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Align(alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Container(decoration: BoxDecoration(
                  color: colorSet.strongestColor,
                  borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.all(5.0),
                child: CharacterTile(characterNumber: gameNumber, fontSizeModifier: 4.0, showDescription: false,)),
          )),
        Flexible(child: DescriptionCard(gameNumber: gameNumber, textColor: colorSet.strongestColor, borderColor: colorSet.secondaryColor, backgroundColor: colorSet.intermediaryColor,))
    ],);
  }
}
