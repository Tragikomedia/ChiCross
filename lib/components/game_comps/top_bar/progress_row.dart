import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';
import 'package:chinese_picross/components/game_comps/top_bar/life_counter.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class ProgressRow extends StatelessWidget {
  final Color mainColor;
  final Color backgroundColor;

  ProgressRow({@required this.mainColor, @required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopText(text: '${localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general']['lives']}: ', color: mainColor,),
            LifeCounter(iconColor: backgroundColor, iconBackgroundColor: mainColor,),
          ],),
      ),
    );
  }
}
