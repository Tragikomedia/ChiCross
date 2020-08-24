import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class LanguageChoiceButton extends StatelessWidget {
  final String text;
  final String language;
  final Color textColor;
  final Color buttonColor;

  LanguageChoiceButton(
      {@required this.text,
      @required this.language,
      @required this.textColor,
      @required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: buttonColor,
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontFamily: 'Cyrulik',
            fontSize: kPlayButtonFontSize),
      ),
      onPressed: () {
        Provider.of<PreferencesProvider>(context, listen: false)
            .chooseLanguageOnStart(language);
        Navigator.pop(context);
      },
    );
  }
}
