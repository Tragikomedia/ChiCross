import 'package:flutter/material.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class MenuButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final Function onPressed;

  MenuButton({@required this.textColor, @required this.backgroundColor, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        localization[Provider.of<PreferencesProvider>(context).language][text],
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold, fontSize: 30.0),),
      color: backgroundColor,
      onPressed: () {
        onPressed();
        },
    );
  }
}
