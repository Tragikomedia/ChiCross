import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final Function onPressed;

  MenuButton({@required this.textColor, @required this.backgroundColor, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontFamily: 'Cyrulik',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                fontSize: 30.0),),
          color: backgroundColor,
          onPressed: () {
            onPressed();
            },
        ),
      ),
    );
  }
}
