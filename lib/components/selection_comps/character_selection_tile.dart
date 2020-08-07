import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/screens/game_screen.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/utilities/models/description.dart';
import 'package:provider/provider.dart';

class CharacterSelectionTile extends StatelessWidget {
  final int index;
  final Description description;

  CharacterSelectionTile({this.index, this.description,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(game: picrossList[index].game, gameNumber: index,)));
      // Default value with ?? makes the app not crash during first usage
    },child: Card(child: Column(children: [Text((Provider.of<ProgressProvider>(context).completenessTracker[index] ?? false) ? description.character : '?'), Text(description.meaning)],),));
  }
}
