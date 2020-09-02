import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/components/shared_comps/character_tile/character_tile.dart';
import 'package:chinese_picross/components/shared_comps/character_tile/adjusted_character_tile.dart';
import 'package:chinese_picross/components/shared_comps/description_card/description_card.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:provider/provider.dart';

class DescriptionScreen extends StatelessWidget {
  final int gameNumber;

  DescriptionScreen({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kPreferredAppBarHeight),
          child: GeneralAppBar(
            text: localization[
                    Provider.of<PreferencesProvider>(context, listen: false)
                        .language]['picross'][gameNumber]
                [picrossList[gameNumber].description.meaning],
            textColor: colorSet.strongestColor,
            backgroundColor: colorSet.intermediaryColor,
          )),
      backgroundColor: colorSet.primaryColor,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'character$gameNumber',
                  child: AdjustedCharacterTile(
                    child: CharacterTile(
                      characterNumber: gameNumber,
                      fontSizeModifier: 4.0,
                    ),
                    color: colorSet.strongestColor,
                  ),
                ),
                Flexible(
                    child: DescriptionCard(
                      gameNumber: gameNumber,
                      textColor: colorSet.strongestColor,
                      backgroundColor: colorSet.intermediaryColor,
                    ))
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AdjustedCharacterTile(
                  child: Hero(
                    tag: 'character$gameNumber',
                    child: CharacterTile(
                      characterNumber: gameNumber,
                      fontSizeModifier: 4.0,
                    ),
                  ),
                  color: colorSet.strongestColor,
                ),
                Flexible(
                    child: DescriptionCard(
                      gameNumber: gameNumber,
                      textColor: colorSet.strongestColor,
                      backgroundColor: colorSet.intermediaryColor,
                    ))
              ],
            );
          }
        )

      ),
    );
  }
}
