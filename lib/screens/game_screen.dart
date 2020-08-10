import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/grid_box.dart';
import 'package:chinese_picross/components/game_comps/save_button.dart';
import 'package:chinese_picross/components/game_comps/victory_view.dart';
import 'package:chinese_picross/components/game_comps/information_bar.dart';


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
    return Scaffold(body: Column(children: [Flexible(fit: FlexFit.loose,child: InformationBar(gameNumber: widget.gameNumber,)),
      ValueListenableBuilder<bool>(valueListenable: gridProvider.isFinished,
    builder: (BuildContext context, bool isFinished, Widget child) {
    return isFinished
        ? VictoryView(gameNumber: widget.gameNumber,)
        : Column(children: [GridBox(width: gridProvider.width, height: gridProvider.height,), SaveButton(gameNumber: widget.gameNumber,)]);})
    ]),);
  }
}
