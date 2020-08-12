import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/finished_game/defeat_title.dart';
import 'package:chinese_picross/components/game_comps/finished_game/try_again_message.dart';
import 'package:chinese_picross/components/game_comps/finished_game/yes_no_button_row.dart';

class DefeatView extends StatelessWidget {
  final int gameNumber;

  DefeatView({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      DefeatTitle(),
      TryAgainMessage(),
       YesNoButtonRow(gameNumber: gameNumber),
    ],);
  }
}
