import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar_text.dart';

class BottomSelectionBar extends StatelessWidget {
  final String completedText;
  final int completedPuzzles;
  final int allPuzzles;
  final Color textColor;
  final Color backgroundColor;

  BottomSelectionBar({@required this.completedText, @required this.completedPuzzles, @required this.allPuzzles, @required this.backgroundColor, @required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: GeneralAppBarText(
          text: '$completedText: $completedPuzzles/$allPuzzles',
        color: textColor,
        ),
      ),
    );
  }
}
