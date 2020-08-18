import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class BigFancyCharacter extends StatelessWidget {
  final String character;
  final Color color;
  final double fontSizeModifier;

  BigFancyCharacter({@required this.character, @required this.color, @required this.fontSizeModifier});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Text(character,
        style: TextStyle(
          fontSize: kBigFancyCharacterFontSize * fontSizeModifier,
          fontFamily: 'MaShanZheng',
          color: color
        ),),
    );
  }
}
