import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class GeneralAppBarText extends StatelessWidget {
  final String text;
  final Color color;

  GeneralAppBarText({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: kGeneralAppBarFontSize,
      fontFamily: 'Cyrulik',
      color: color
    ),);
  }
}
