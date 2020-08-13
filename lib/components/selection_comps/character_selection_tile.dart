import 'package:flutter/material.dart';
import 'package:chinese_picross/components/selection_comps/selection_popup.dart';
import 'package:chinese_picross/components/selection_comps/selection_list_tile.dart';

class CharacterSelectionTile extends StatelessWidget {
  final int index;
  final bool isCompleted;

  CharacterSelectionTile({@required this.index, this.isCompleted = false,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      showDialog(context: context, builder: (BuildContext context) {
       return SelectionPopup(gameNumber: index,);
      });

    },child: SelectionListTile(gameNumber: index, isCompleted: isCompleted,));
  }
}
