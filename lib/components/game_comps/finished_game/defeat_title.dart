import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class DefeatTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0) ,
        color: ThemeManager.of(context).colorSet.strongestColor,
        child: Text(
          localization[Provider.of<PreferencesProvider>(context, listen: false).language]['game']['defeattitle'],
          style: TextStyle(fontSize: kDefeatTitleFontSize,
              fontFamily: 'Cyrulik',
              color: ThemeManager.of(context).colorSet.primaryColor),
          textAlign: TextAlign.center, ));
  }
}
