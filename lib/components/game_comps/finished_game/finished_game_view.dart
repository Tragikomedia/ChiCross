import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/components/game_comps/finished_game/defeat_view.dart';
import 'package:chinese_picross/components/game_comps/finished_game/victory_view.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/grid_provider.dart';

class FinishedGameView extends StatefulWidget {
  final int gameNumber;

  FinishedGameView({@required this.gameNumber});

  @override
  _FinishedGameViewState createState() => _FinishedGameViewState();
}

class _FinishedGameViewState extends State<FinishedGameView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var progressProvider = Provider.of<ProgressProvider>(context, listen: false);
      if (Provider.of<GridProvider>(context, listen: false).isVictorious) {
        progressProvider.markCompleted(widget.gameNumber);
      }
      progressProvider.eraseLevelProgress(widget.gameNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<GridProvider>(context, listen: false).isVictorious) {
      return VictoryView(gameNumber: widget.gameNumber,);
    }
    return DefeatView(gameNumber: widget.gameNumber);
  }
}
