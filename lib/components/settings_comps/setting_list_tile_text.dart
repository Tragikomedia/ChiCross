import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class SettingListTileText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;

  SettingListTileText({@required this.text, @required this.color, this.textAlign=TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontFamily: 'Cyrulik',
        fontSize: kSettingListTileTextFontSize,
      ),
    );
  }
}
