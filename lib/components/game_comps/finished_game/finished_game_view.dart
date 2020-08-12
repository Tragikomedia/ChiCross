import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/components/game_comps/finished_game/defeat_view.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/grid_provider.dart';

class FinishedGameView extends StatelessWidget {
  final int gameNumber;

  FinishedGameView({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    var progressProvider = Provider.of<ProgressProvider>(context, listen: false);
    if (Provider.of<GridProvider>(context, listen: false).isVictorious) {
      return Column(children: [
        Text('Victory'),
        RaisedButton(child: Text('Go back'), onPressed: () {
          progressProvider.markCompleted(gameNumber);
          progressProvider.eraseLevelProgress(gameNumber);
          Navigator.pop(context);
        },)
      ]);
    }
    return DefeatView(gameNumber: gameNumber);
  }
}
