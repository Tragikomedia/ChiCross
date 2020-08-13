import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/character_tile.dart';

class VictoryView extends StatelessWidget {
  final int gameNumber;

  VictoryView({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CharacterTile(characterNumber: gameNumber,)
    ],);
  }
}
