import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/games.dart';
import 'package:chinese_picross/screens/game_screen.dart';

class CharacterSelectionTile extends StatelessWidget {
  final int index;
  final String character;
  final String description;
  final bool isCompleted;

  CharacterSelectionTile({this.index, this.character, this.description, this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(game: games[index],)));
    },child: Card(child: Column(children: [Text(isCompleted ? character : '?'), Text(description)],),));
  }
}
