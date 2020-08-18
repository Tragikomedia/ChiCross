import 'package:flutter/material.dart';
import 'package:chinese_picross/components/settings_comps/setting_list_tile_text.dart';
import 'package:chinese_picross/components/settings_comps/confirmation_popup_button.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:flushbar/flushbar.dart';
import 'package:provider/provider.dart';

class ConfirmationPopup extends StatelessWidget {
  final Color backgroundColor;
  final Color primaryColor;

  ConfirmationPopup({@required this.primaryColor, @required this.backgroundColor,});

  @override
  Widget build(BuildContext context) {
    var text = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['settings'];
    var generalText = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general'];
    return SimpleDialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),),
        backgroundColor: backgroundColor,
        title: SettingListTileText(
          color: primaryColor,
          text: text['confirmationtext'],
          textAlign: TextAlign.center,),
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConfirmationPopupButton(
                  text: generalText['yes'],
                  textColor: backgroundColor,
                  backgroundColor: primaryColor,
                  onPressed: () {
                    Provider.of<ProgressProvider>(context, listen: false).deleteDb();
                    Flushbar(
                      messageText: SettingListTileText(
                                        text: text['flushtext'],
                                        color: primaryColor,),
                      backgroundColor: backgroundColor,
                      duration: Duration(seconds: 2),
                    )..show(context);
                  },
                ),
                ConfirmationPopupButton(
                  text: generalText['no'],
                  textColor: backgroundColor,
                  backgroundColor: primaryColor,
                ),
              ],
            )
        ),]
    );
  }
}
