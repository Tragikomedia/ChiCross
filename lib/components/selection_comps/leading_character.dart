import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class LeadingCharacter extends StatelessWidget {
  final Color characterColor;
  final Color backgroundColor;
  final String character;

  LeadingCharacter({@required this.character, @required this.characterColor, @required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(
        character,
        style: TextStyle(
          fontSize: kLeadingCharacterFontSize,
          fontFamily: 'MaShanZheng',
          color: characterColor
        ),
      ),);
  }
}
