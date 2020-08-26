import 'package:chinese_picross/firebase/firebase_manager.dart';
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

class _FinishedGameViewState extends State<FinishedGameView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var progressProvider =
          Provider.of<ProgressProvider>(context, listen: false);
      if (Provider.of<GridProvider>(context, listen: false).isVictorious) {
        progressProvider.markCompleted(widget.gameNumber);
        saveUserProgressInFirestore(widget.gameNumber);
      }
      progressProvider.eraseLevelProgress(widget.gameNumber);
    });
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _offsetAnimation,
        child: Provider.of<GridProvider>(context, listen: false).isVictorious
            ? VictoryView(
                gameNumber: widget.gameNumber,
              )
            : DefeatView(gameNumber: widget.gameNumber));
  }
}
