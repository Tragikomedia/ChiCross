import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/utilities/game_utils/dimensions_utilities.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:provider/provider.dart';

class LifeIcon extends StatelessWidget {
  final Color iconColor;

  LifeIcon({@required this.iconColor, });

  @override
  Widget build(BuildContext context) {
    var gameProv = Provider.of<GridProvider>(context, listen: false).game;
    return Text('心', style: TextStyle(color: iconColor, fontSize: informationBarFontSize(context, gameProv.width, gameProv.height) + kInformationBarFontModifier, fontFamily: 'MaShanZheng'),);
  }
}
