import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  LogoText({@required this.color, @required this.size, this.text='',});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Cyrulik',
      ),
    );
  }
}
