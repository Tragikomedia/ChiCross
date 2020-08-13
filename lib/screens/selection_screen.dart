import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/components/selection_comps/character_selection_tile.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/components/shared_comps/general_app_bar.dart';
import 'package:chinese_picross/components/selection_comps/bottom_selection_bar.dart';
import 'package:provider/provider.dart';


class SelectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    List completenessTracker = Provider.of<ProgressProvider>(context).completenessTracker;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kPreferredAppBarHeight),child: GeneralAppBar(text: 'Puzzle selection', textColor: colorSet.strongestColor, backgroundColor: colorSet.intermediaryColor,)),
      backgroundColor: ThemeManager.of(context).colorSet.primaryColor,
      bottomNavigationBar: PreferredSize(preferredSize: Size.fromHeight(kPreferredAppBarHeight), child: BottomSelectionBar(allPuzzles: completenessTracker.length, completedPuzzles: completenessTracker.where((isCompleted) => isCompleted == true).length, textColor: colorSet.strongestColor, backgroundColor: colorSet.intermediaryColor),),
      body: SafeArea(
        child: ListView.builder(scrollDirection: Axis.vertical, itemCount: picrossList.length, itemBuilder: (BuildContext context, int index) {
          return CharacterSelectionTile(index: index, isCompleted:  completenessTracker[index] ?? false,);
    }),
      ),);
  }
}
