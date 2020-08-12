import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class GridCornerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Container(
        decoration: BoxDecoration(color: colorSet.primaryColor,
        border: Border(top: BorderSide(width: 3.0, color: colorSet.strongestColor),
        right: BorderSide(width: 2.0, color: colorSet.strongestColor),
        bottom: BorderSide(width: 2.0, color: colorSet.strongestColor))),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            '福',
            style: TextStyle(color: colorSet.secondaryColor,
            fontFamily: 'MaShanZheng'),
          ),
        ));
  }
}
