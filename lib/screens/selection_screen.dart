import 'package:flutter/material.dart';
import 'package:chinese_picross/components/selection_comps/character_selection_tile.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/picross_files/games.dart';
import 'package:provider/provider.dart';

class SelectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<ProgressProvider>(context).progressDB;
    return Scaffold(body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemCount: games.length, itemBuilder: (BuildContext context, int index) {
      return CharacterSelectionTile(index: index, character: '柯', description: 'Powerful', isCompleted: db[index]['completed'] == 1,);
    }),);
  }
}
