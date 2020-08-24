import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class MenuPopupText extends StatelessWidget {
  final Color color;

  MenuPopupText({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Choose language/Wybierz język',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Cyrulik',
          color: color,
          fontSize: kMenuPopupTextFontSize
      ),
    );
  }
}
