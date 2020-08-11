import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/grid/grid_box.dart';
import 'package:chinese_picross/components/game_comps/finished_game/victory_view.dart';
import 'package:chinese_picross/components/game_comps/top_bar/information_bar.dart';
import 'package:chinese_picross/components/game_comps/top_bar/top_text.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';


class GameScreen extends StatefulWidget {
  final int gameNumber;

  GameScreen({@required this.gameNumber});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {


  @override
  Widget build(BuildContext context) {
    var gridProvider = Provider.of<GridProvider>(context, listen: false);
    var colorSet = ThemeManager.of(context).colorSet;
    return Scaffold(appBar: PreferredSize(preferredSize: Size.fromHeight(40.0),
        child: AppBar(backgroundColor: colorSet.secondaryColor, title: TopText(text: '${widget.gameNumber + 1}. ${picrossList[widget.gameNumber].description.meaning}', color: colorSet.primaryColor,),)),
      body: Container(color: colorSet.primaryColor,
      child: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          InformationBar(gameNumber: widget.gameNumber, mainColor: colorSet.primaryColor, sideColor: colorSet.secondaryColor,),
          ValueListenableBuilder<bool>(valueListenable: gridProvider.isFinished,
        builder: (BuildContext context, bool isFinished, Widget child) {
        return isFinished
            ? VictoryView(gameNumber: widget.gameNumber,)
            : GridBox(width: gridProvider.width, height: gridProvider.height,);}),
            ]),
      ),
    ),);
  }
}
