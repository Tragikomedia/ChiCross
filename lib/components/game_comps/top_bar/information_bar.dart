import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/top_bar/save_button.dart';
import 'package:chinese_picross/components/game_comps/top_bar/progress_row.dart';
import 'package:chinese_picross/utilities/game_utils/dimensions_utilities.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:provider/provider.dart';

class InformationBar extends StatelessWidget {
  final int gameNumber;
  final Color mainColor;
  final Color sideColor;

  InformationBar({@required this.gameNumber, @required this.mainColor, @required this.sideColor});
  
  @override
  Widget build(BuildContext context) {
    var gameProv = Provider.of<GridProvider>(context, listen: false);
    return LimitedBox(maxHeight: informationBarHeight(context, gameProv.width, gameProv.height) - 65,
      child: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Divider(color: sideColor, thickness: 3.0,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: ProgressRow(mainColor: mainColor, backgroundColor: sideColor,)),
              SaveButton(gameNumber: gameNumber,)
            ],),
          Divider(color: sideColor, thickness: 3.0,),
        ],),
      ),
    );
  }
}
