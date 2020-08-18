import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/components/shared_comps/character_tile/big_fancy_character.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class CharacterTile extends StatelessWidget {
  final int characterNumber;
  final String character;
  final String meaning;
  final double fontSizeModifier;

  CharacterTile({@required this.characterNumber, this.fontSizeModifier = 1,}):
        character = picrossList[characterNumber].description.character,
        meaning = picrossList[characterNumber].description.meaning;

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Card(
      color: colorSet.secondaryColor,
      child:
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: BigFancyCharacter(character: character, color: colorSet.primaryColor, fontSizeModifier: fontSizeModifier,),
        ),
      );
  }
}
