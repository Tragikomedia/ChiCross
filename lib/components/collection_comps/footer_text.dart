import 'package:flutter/material.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:provider/provider.dart';

class FooterText extends StatelessWidget {
  final int gameNumber;

  FooterText({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return Text(
      localization[Provider.of<PreferencesProvider>(context, listen: false).language]['picross'][gameNumber][picrossList[gameNumber].description.meaning],
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ThemeManager.of(context).colorSet.strongestColor,
        fontFamily: 'Cyrulik',
        fontSize: 18.0,
    ),
    );
  }
}
