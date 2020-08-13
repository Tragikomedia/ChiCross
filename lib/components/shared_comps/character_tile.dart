import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/components/shared_comps/big_fancy_character.dart';
import 'package:chinese_picross/components/shared_comps/character_description.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class CharacterTile extends StatelessWidget {
  final int characterNumber;
  final String character;
  final String pronunciation;
  final String meaning;

  CharacterTile({@required this.characterNumber}):
        character = picrossList[characterNumber].description.character,
        pronunciation = picrossList[characterNumber].description.chinesePronunciation,
        meaning = picrossList[characterNumber].description.meaning;

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Card(
      color: colorSet.secondaryColor,
      child: Column(
      children: [
        BigFancyCharacter(character: character, color: colorSet.primaryColor,),
        CharacterDescription(text: pronunciation, color: colorSet.intermediaryColor,),
      CharacterDescription(text: meaning, color: colorSet.primaryColor,)],),);
  }
}
