import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/game_utils/game.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/grid_box.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  GameScreen({@required this.game});

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
        ? Column(children: [Text('Victory'), RaisedButton(onPressed: () {
      Provider.of<ProgressProvider>(context, listen: false).markCompleted(widget.game.gameNumber);
      Navigator.pop(context);
      print('Done');
    },)])
        : Column(children: [Text('Welcome to ChiCross!'), GridBox(width: widget.game.width, height: widget.game.height,)]);}))
    );
  }
}
