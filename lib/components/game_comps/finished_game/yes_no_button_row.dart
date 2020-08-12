import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/finished_game/play_again_choice_button.dart';

class YesNoButtonRow extends StatelessWidget {
  final int gameNumber;

  YesNoButtonRow({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(top: 10.0),
    child:
    Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayAgainChoiceButton(gameNumber: gameNumber),
        PlayAgainChoiceButton(),
      ],));
  }
}
