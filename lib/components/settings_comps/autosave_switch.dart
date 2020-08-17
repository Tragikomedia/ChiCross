import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/models/theme_color_set.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class AutosaveSwitch extends StatelessWidget {
  final ThemeColorSet colorSet;

  AutosaveSwitch({@required this.colorSet});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<PreferencesProvider>(context).autosaveOn,
      activeColor: colorSet.strongestColor,
      inactiveTrackColor: colorSet.intermediaryColor,
      inactiveThumbColor: colorSet.intermediaryColor,
      onChanged: (value) {
        Provider.of<PreferencesProvider>(context, listen: false).toggleAutosave();
      },
    );
  }
}
