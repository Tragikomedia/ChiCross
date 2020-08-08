import 'package:flutter/material.dart';
import 'package:chinese_picross/components/selection_comps/start_game_selection.dart';

class SelectionPopup extends StatelessWidget {
  final int gameNumber;

  SelectionPopup({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),), backgroundColor: Theme.of(context).colorScheme.secondary, child: StartGameSelection(gameNumber: gameNumber,),);
  }
}

