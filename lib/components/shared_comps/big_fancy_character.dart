import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class BigFancyCharacter extends StatelessWidget {
  final String character;
  final Color color;

  BigFancyCharacter({@required this.character, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(character,
      style: TextStyle(
        fontSize: kBigFancyCharacterFontSize,
        fontFamily: 'MaShanZheng',
        color: color
      ),);
  }
}
