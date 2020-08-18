import 'package:flutter/material.dart';

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
        text,
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
