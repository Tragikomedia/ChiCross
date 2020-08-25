import 'package:flutter/material.dart';
import 'package:chinese_picross/components/settings_comps/confirmation_popup_button.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/firebase/firebase_manager.dart';
import 'package:provider/provider.dart';

class FirebasePopupButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;

  FirebasePopupButtons({@required this.textColor, @required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    var loc = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ConfirmationPopupButton(
          text: loc['yes'],
          textColor: textColor,
          backgroundColor: backgroundColor,
          onPressed: () {
            deleteFirestoreDatabase(Provider.of<ProgressProvider>(context, listen: false).completenessTracker.length);
          },
        ),
        ConfirmationPopupButton(
          text: loc['no'],
          textColor: textColor,
          backgroundColor: backgroundColor,
        )
      ],
    );
  }
}
