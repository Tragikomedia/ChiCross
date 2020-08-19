import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color color;

  TitleText({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: 'Cyrulik',
        fontSize: kTutorialTitleFontSize
      ),
    );
  }
}
