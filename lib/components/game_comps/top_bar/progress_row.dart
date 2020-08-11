import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';
import 'package:chinese_picross/components/game_comps/top_bar/life_counter.dart';

class ProgressColumn extends StatelessWidget {
  final Color mainColor;
  final Color backgroundColor;

  ProgressColumn({@required this.mainColor, @required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopText(text: 'Lives:', color: mainColor,),
            LifeCounter(iconColor: mainColor),
          ],),
      ),
    );
  }
}
