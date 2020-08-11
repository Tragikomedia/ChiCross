import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/game_utils/dimensions_utilities.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:provider/provider.dart';

class TopText extends StatelessWidget {
  final String text;
  final Color color;

  TopText({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    var gameProv = Provider.of<GridProvider>(context, listen: false).game;
    return Text(text, style: TextStyle(color: color, fontSize: informationBarFontSize(context, gameProv.width, gameProv.height) + kInformationBarFontModifier, fontFamily: 'Cyrulik'),);
  }
}
