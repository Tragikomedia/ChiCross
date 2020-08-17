import 'package:flutter/material.dart';
import 'package:chinese_picross/components/settings_comps/setting_list_tile_text.dart';

class ConfirmationPopupButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;

  ConfirmationPopupButton({@required this.text, @required this.textColor, @required this.backgroundColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor,
      child: SettingListTileText(
        text: text,
        color: textColor,
      ),
      onPressed: () {
        Navigator.pop(context);
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }
}
