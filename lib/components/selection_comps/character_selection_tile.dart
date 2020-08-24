import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/popup/base_popup.dart';
import 'package:chinese_picross/components/selection_comps/selection_list_tile.dart';
import 'package:chinese_picross/components/selection_comps/selection_popup_text.dart';
import 'package:chinese_picross/components/selection_comps/start_game_selection.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class CharacterSelectionTile extends StatelessWidget {
  final int index;
  final bool isCompleted;

  CharacterSelectionTile({
    @required this.index,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BasePopup(
                  textWidget: SelectionPopupText(
                    gameNumber: index,
                    color: colorSet.secondaryColor,
                  ),
                  choiceWidget: StartGameSelection(
                    gameNumber: index,
                    textColor: colorSet.intermediaryColor,
                    backgroundColor: colorSet.secondaryColor,
                  ),
                );
              });
        },
        child: SelectionListTile(
          gameNumber: index,
          isCompleted: isCompleted,
        ));
  }
}
