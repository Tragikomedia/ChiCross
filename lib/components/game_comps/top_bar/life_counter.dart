import 'package:flutter/material.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/top_bar/life_icon.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';
import 'package:provider/provider.dart';

class LifeCounter extends StatelessWidget {
  final Color iconColor;
  final Color iconBackgroundColor;

  LifeCounter({@required this.iconColor, @required this.iconBackgroundColor});

  List<LifeIcon> getLifeIcons(BuildContext context, int livesNumber) {
    List<LifeIcon> iconList = [];
    for (int i = 0; i < livesNumber; i++) {
      iconList.add(LifeIcon(iconColor: iconColor, iconBackgroundColor: iconBackgroundColor,));
    }
    return iconList;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: Provider.of<GridProvider>(context, listen: false).livesLeft, builder: (context, livesLeft, child) {
      Widget child;
      livesLeft >= 0 ? child = Row(children: getLifeIcons(context, livesLeft),) : child = TopText(text: 'Unlimited', color: iconBackgroundColor,);
      return child;
    },);
  }
}
