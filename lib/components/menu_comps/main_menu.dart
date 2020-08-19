import 'package:flutter/material.dart';
import 'package:chinese_picross/screens/selection_screen.dart';
import 'package:chinese_picross/screens/settings_screen.dart';
import 'package:chinese_picross/screens/collection_screen.dart';
import 'package:chinese_picross/screens/tutorial_screen.dart';
import 'package:chinese_picross/components/menu_comps/menu_button.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {

  List _getCollectionList(BuildContext context) {
    List completedList = Provider.of<ProgressProvider>(context, listen: false).completenessTracker;
    List completedPuzzles = [];
    for (int i = 0; i < completedList.length; i++)  {
      if (completedList[i]) {
        completedPuzzles.add(i);
      }
    }
    return completedPuzzles;
  }

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    var text = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['menu'];
    var generalText = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general'];
    return Center(
      child: Container(
        child: Column(
          children: [
            MenuButton(
              text: text['play'],
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));
              },
            ),
            MenuButton(
              text: generalText['tutorial'],
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TutorialScreen()));
              },
            ),
            MenuButton(
              text: generalText['collection'],
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionScreen(completedPuzzles: _getCollectionList(context),)));
              },
            ),
            MenuButton(
              text: generalText['settings'],
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
            ],
        ),
      ),
    );
  }
}
