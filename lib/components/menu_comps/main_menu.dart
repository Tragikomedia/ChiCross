import 'package:flutter/material.dart';
import 'package:chinese_picross/screens/selection_screen.dart';
import 'package:chinese_picross/screens/settings_screen.dart';
import 'package:chinese_picross/components/menu_comps/menu_button.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Center(
      child: Container(
        child: Column(
          children: [
            MenuButton(
              text: 'm_play',
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));
              },
            ),
            MenuButton(
              text: 'm_settings',
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
            MenuButton(
              text: 'm_language',
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
              onPressed: () {
                Provider.of<PreferencesProvider>(context, listen:false).changeLanguage();
              },
            ),
            ],
        ),
      ),
    );
  }
}
