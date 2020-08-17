import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/components/shared_comps/general_app_bar.dart';
import 'package:chinese_picross/components/settings_comps/setting_list_tile.dart';
import 'package:chinese_picross/components/settings_comps/autosave_switch.dart';
import 'package:chinese_picross/components/settings_comps/settings_button.dart';
import 'package:chinese_picross/components/settings_comps/confirmation_popup.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<PreferencesProvider>(
        builder: (context, prefs, child) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              SettingListTile(
                color: strongestColor,
                text: 'Autosave: ${prefs.autosaveOn ? 'On' : 'Off'}',
                child: AutosaveSwitch(
                  colorSet: ThemeManager.of(context).colorSet,
                ),),
              SettingListTile(
                color: strongestColor,
                text: 'Lives: ${prefs.lives != -1 ? prefs.lives : 'Unlimited'}',
                child: SettingsButton(
                  textColor: primaryColor,
                  backgroundColor: strongestColor,
                  onPressed: () {
                    prefs.changeNumberOfLives();
                  },),
              ),
              SettingListTile(
                color: strongestColor,
                text: 'Theme: ${prefs.themeData.name}',
                child: SettingsButton(
                  textColor: primaryColor,
                  backgroundColor: strongestColor,
                  onPressed: () {
                    prefs.changeThemeNumber();
                  },
                ),
              ),
              SettingListTile(
                color: strongestColor,
                text: 'Synchronise progress',
                child: SettingsButton(
                  text: 'TODO',
                  textColor: primaryColor,
                  backgroundColor: strongestColor,
                  onPressed: () {

                  },
                ),
              ),
              SettingListTile(
                color: strongestColor,
                text: 'Erase progress',
                child: SettingsButton(
                    text: 'Erase',
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
      ),
    );
  }
}
