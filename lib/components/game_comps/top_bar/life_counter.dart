import 'package:flutter/material.dart';
import 'life_icon.dart';

class LifeCounter extends StatelessWidget {
  final Color iconColor;

  LifeCounter({@required this.iconColor,});

  @override
  Widget build(BuildContext context) {
    return Row(children: [LifeIcon(iconColor: iconColor,), LifeIcon(iconColor: iconColor, ), LifeIcon(iconColor: iconColor,), LifeIcon(iconColor: iconColor,), LifeIcon(iconColor: iconColor,) ],);
  }
}
