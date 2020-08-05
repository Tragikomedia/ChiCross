import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/games.dart';
import 'package:chinese_picross/utilities/game_utils/game.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/grid_box.dart';
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
        game: widget.game),child: Column(children: [Text('Welcome to ChiCross!'), GridBox(width: widget.game.width, height: widget.game.height,)])),);
  }
}
