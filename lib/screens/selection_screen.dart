import 'package:flutter/material.dart';
import 'package:chinese_picross/components/selection_comps/character_selection_tile.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';


class SelectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemCount: picrossList.length, itemBuilder: (BuildContext context, int index) {
      return CharacterSelectionTile(index: index, description: picrossList[index].description,);
    }),);
  }
}
