import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/utilities/models/game.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/grid_box.dart';
import 'package:chinese_picross/components/game_comps/save_button.dart';
import 'package:chinese_picross/components/game_comps/victory_view.dart';


class GameScreen extends StatefulWidget {
  final Game game;
  final int gameNumber;

  GameScreen({@required this.game, @required this.gameNumber});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChangeNotifierProvider(create: (context) => GridProvider(
          game: widget.game),child: ValueListenableBuilder<bool>(valueListenable: widget.game.isFinished,
    builder: (BuildContext context, bool isFinished, Widget child) {
    return isFinished
        ? VictoryView(gameNumber: widget.gameNumber,)
        : Column(children: [Text('Welcome to ChiCross!'), GridBox(width: widget.game.width, height: widget.game.height,), SaveButton(gameNumber: widget.gameNumber,)]);}))
    );
  }
}
