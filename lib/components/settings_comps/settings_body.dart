import 'package:flutter/material.dart';
import 'package:chinese_picross/screens/firebase_screen.dart';
import 'package:chinese_picross/components/settings_comps/setting_list_tile.dart';
import 'package:chinese_picross/components/settings_comps/autosave_switch.dart';
import 'package:chinese_picross/components/settings_comps/settings_button.dart';
import 'package:chinese_picross/components/settings_comps/confirmation_popup.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/utilities/general_utils/transition_animation.dart';
import 'package:provider/provider.dart';

class SettingsBody extends StatelessWidget {
  final Color primaryColor;
  final Color strongestColor;

  SettingsBody({@required this.primaryColor, @required this.strongestColor});

  @override
  Widget build(BuildContext context) {
    var text = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['settings'];
    var generalText = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general'];
    var themes = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['theme'];
    return Consumer<PreferencesProvider>(
      builder: (context, prefs, child) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            SettingListTile(
              color: strongestColor,
              text: '${text['autosave']}: ${prefs.autosaveOn ? text['on'] : text['off']}',
              child: AutosaveSwitch(
                colorSet: ThemeManager.of(context).colorSet,
              ),),
            SettingListTile(
              color: strongestColor,
              text: '${generalText['lives']}: ${prefs.lives != -1 ? prefs.lives : generalText['unlimited']}',
              child: SettingsButton(
                text: text['change'],
                textColor: primaryColor,
                backgroundColor: strongestColor,
                onPressed: () {
                  prefs.changeNumberOfLives();
                },),
            ),
            SettingListTile(
              color: strongestColor,
              text: '${text['theme']}: ${themes[prefs.themeData.name]}',
              child: SettingsButton(
                text: text['change'],
                textColor: primaryColor,
                backgroundColor: strongestColor,
                onPressed: () {
                  prefs.changeThemeNumber();
                },
              ),
            ),
            SettingListTile(
              color: strongestColor,
              text: '${text['language']}: ${text['currentlang']}',
              child: SettingsButton(
                text: text['change'],
                textColor: primaryColor,
                backgroundColor: strongestColor,
                onPressed: () {
                  prefs.changeLanguage();
                },
              ),
            ),
            SettingListTile(
              color: strongestColor,
              text: text['syncprog'],
              child: SettingsButton(
                text: text['proceed'],
                textColor: primaryColor,
                backgroundColor: strongestColor,
                onPressed: () {
                  Navigator.of(context).push(createRoute(FirebaseScreen()));
                },
              ),
            ),
            SettingListTile(
              color: strongestColor,
              text: text['eraseprog'],
              child: SettingsButton(
                  text: text['erase'],
                  textColor: primaryColor,
                  backgroundColor: strongestColor,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ConfirmationPopup(
                              primaryColor: primaryColor,
                              backgroundColor: strongestColor,
                          );
                        });
                  }),
            )
          ],);
      },
    );
  }
}
