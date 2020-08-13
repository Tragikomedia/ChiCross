import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/general_app_bar_text.dart';

class GeneralAppBar extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;

  GeneralAppBar({@required this.textColor, @required this.backgroundColor, @required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: textColor),
      title: Align(alignment: Alignment.centerRight,
        child: GeneralAppBarText(text: text, color: textColor,)
      ),);
  }
}
