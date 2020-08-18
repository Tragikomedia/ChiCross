import 'package:flutter/material.dart';
import 'package:chinese_picross/components/settings_comps/setting_list_tile_text.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class SettingsButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final Function onPressed;

  SettingsButton({@required this.textColor, @required this.backgroundColor, @required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor,
      child: SettingListTileText(text: text, color: textColor,),
      onPressed: () {
        onPressed();
      },
    );
  }
}
