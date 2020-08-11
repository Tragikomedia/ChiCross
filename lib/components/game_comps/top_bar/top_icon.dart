import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  TopIcon({@required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color);
  }
}
