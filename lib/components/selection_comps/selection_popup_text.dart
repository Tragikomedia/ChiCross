import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class SelectionPopupText extends StatelessWidget {
  final int gameNumber;
  final Color color;

  SelectionPopupText({@required this.gameNumber, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
        'Would you like to play level ${gameNumber + 1}?',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Cyrulik',
        color: color,
        fontSize: kSelectionTileTextFontSize
      ),
    );
  }
}
