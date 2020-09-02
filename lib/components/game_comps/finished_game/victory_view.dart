import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/character_tile/character_tile.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/components/shared_comps/description_card/description_card.dart';
import 'package:chinese_picross/components/shared_comps/character_tile/adjusted_character_tile.dart';

class VictoryView extends StatelessWidget {
  final int gameNumber;

  VictoryView({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AdjustedCharacterTile(
          color: colorSet.strongestColor,
          child: CharacterTile(
            characterNumber: gameNumber,
            fontSizeModifier: 4.0,),
        ),
        Flexible(
            child: DescriptionCard(
              gameNumber: gameNumber,
              textColor: colorSet.strongestColor,
              backgroundColor: colorSet.intermediaryColor,))
    ],);
  }
}
