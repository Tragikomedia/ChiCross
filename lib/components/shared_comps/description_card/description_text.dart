import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;
  final bool isChinese;

  DescriptionText({@required this.text, @required this.color, this.isChinese = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: isChinese ? kDescriptionTextFontSize + 4 : kDescriptionTextFontSize,
        fontFamily: isChinese ? 'XiaoWei' : 'Cyrulik',
      ),
    );
  }
}
