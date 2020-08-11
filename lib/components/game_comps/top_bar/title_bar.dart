import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_icon.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';

class TitleBar extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color mainColor;

  TitleBar({@required this.text, @required this.backgroundColor, @required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Card(color: backgroundColor,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [TopIcon(icon: Icons.arrow_back, color: mainColor,), TopText(text: text, color: mainColor,)],));
  }
}
