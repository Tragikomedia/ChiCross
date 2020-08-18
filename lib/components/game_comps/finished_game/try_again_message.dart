import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class TryAgainMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      localization[Provider.of<PreferencesProvider>(context, listen: false).language]['game']['defeatmessage'],
      style: TextStyle(
          fontSize: kTryAgainFontSize,
          color: ThemeManager.of(context).colorSet.secondaryColor,
          fontFamily: 'Cyrulik'),
      textAlign: TextAlign.center,);
  }
}
