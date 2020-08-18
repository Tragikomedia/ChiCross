import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar.dart';
import 'package:chinese_picross/components/collection_comps/no_tiles_message.dart';
import 'package:chinese_picross/components/collection_comps/collection_grid.dart';
import 'package:provider/provider.dart';

class CollectionScreen extends StatelessWidget {
  final List completedPuzzles;

  CollectionScreen({@required this.completedPuzzles});

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    var text = localization[Provider.of<PreferencesProvider>(context, listen: false).language];
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              kPreferredAppBarHeight),
          child: GeneralAppBar(
            text: text['general']['collection'],
            textColor: colorSet.strongestColor,
            backgroundColor: colorSet.intermediaryColor,)
      ),
        backgroundColor: colorSet.primaryColor,
      body: completedPuzzles.length == 0
            ? NoTilesMessage(
                text: text['collection']['notilemessage'],
                color: colorSet.strongestColor,
              )
            : CollectionGrid(
                correctTiles: completedPuzzles,
            )
    );
  }
}
