import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class SelectionPopupText extends StatelessWidget {
  final int gameNumber;
  final Color color;

  SelectionPopupText({@required this.gameNumber, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
        '${localization[Provider.of<PreferencesProvider>(context, listen: false).language]['selection']['selectionconfirmation']} ${gameNumber + 1}?',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Cyrulik',
        color: color,
        fontSize: kSelectionTileTextFontSize
      ),
    );
  }
}
