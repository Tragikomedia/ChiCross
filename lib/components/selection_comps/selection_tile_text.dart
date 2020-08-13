import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class SelectionTileText extends StatelessWidget {
  final String text;
  final Color color;

  SelectionTileText({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Cyrulik',
        fontSize: kSelectionTileTextFontSize
      ),
    );
  }
}
