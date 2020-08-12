import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class DefeatTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0) ,
        color: ThemeManager.of(context).colorSet.gridNumbersColor,
        child: Text('KLĘSKA',
          style: TextStyle(fontSize: kDefeatTitleFontSize,
              fontFamily: 'Cyrulik',
              color: ThemeManager.of(context).colorSet.primaryColor),
          textAlign: TextAlign.center, ));
  }
}
