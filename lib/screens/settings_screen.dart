import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/components/shared_comps/general_app_bar.dart';
import 'package:chinese_picross/components/settings_comps/settings_body.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color primaryColor = ThemeManager.of(context).colorSet.primaryColor;
    Color intermediaryColor = ThemeManager.of(context).colorSet.intermediaryColor;
    Color strongestColor = ThemeManager.of(context).colorSet.strongestColor;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kPreferredAppBarHeight),
          child: GeneralAppBar(
            text: 'Settings', 
            textColor: strongestColor, 
            backgroundColor: intermediaryColor,)),
      backgroundColor: primaryColor,
      body: SettingsBody(
        primaryColor: primaryColor,
        strongestColor: strongestColor,
      ),
    );
  }
}
