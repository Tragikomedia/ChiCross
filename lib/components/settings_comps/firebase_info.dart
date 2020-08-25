import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/components/settings_comps/confirmation_popup_button.dart';
import 'package:chinese_picross/components/shared_comps/popup/base_popup.dart';
import 'package:chinese_picross/components/settings_comps/firebase_text.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class FirebaseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return GestureDetector(
      child: Icon(
        Icons.info_outline,
        color: colorSet.strongestColor,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => BasePopup(
            choiceWidget: ConfirmationPopupButton(
              text: 'OK',
              textColor: colorSet.primaryColor,
              backgroundColor: colorSet.secondaryColor,
            ),
            textWidget: FirebaseText(
              color: colorSet.secondaryColor,
              text: localization[Provider.of<PreferencesProvider>(context, listen: false).language]['firebase']['text'],
            ),
          ),
        );
      },
    );
  }
}
