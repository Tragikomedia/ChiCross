import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class TutorialContent extends StatelessWidget {
  final String content;
  final Color color;

  TutorialContent({@required this.color, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: color,
        fontFamily: 'Cyrulik',
        fontSize: kTutorialContentFontSize
      ),
    );
  }
}
