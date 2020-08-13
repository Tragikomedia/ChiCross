import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class CharacterDescription extends StatelessWidget {
  final String text;
  final Color color;

  CharacterDescription({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      child: Text(text,
        style: TextStyle(
          color: color,
          fontFamily: 'Cyrulik',
          fontSize: kCharacterDescriptionFontSize,
        ),),
    );
  }
}
