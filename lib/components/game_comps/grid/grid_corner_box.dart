import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class GridCornerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: ThemeManager.of(context).colorSet.primaryColor),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            '福',
            style: TextStyle(color: ThemeManager.of(context).colorSet.secondaryColor,
            fontFamily: 'MaShanZheng'),
          ),
        ));
  }
}
