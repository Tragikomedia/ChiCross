import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/screens/game_screen.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class PlayAgainChoiceButton extends StatelessWidget {
  final int gameNumber;

  PlayAgainChoiceButton({
    this.gameNumber,
  });

  @override
  Widget build(BuildContext context) {
    var text = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general'];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
          if (gameNumber != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (context) => GridProvider(
                              game: picrossList[gameNumber].game,
                              lives: Provider.of<PreferencesProvider>(context,
                                      listen: false)
                                  .lives,
                            ),
                        child: GameScreen(
                          gameNumber: gameNumber,
                        ))));
          }
        },
        color: ThemeManager.of(context).colorSet.secondaryColor,
        child: Text(
          gameNumber != null ? text['yes'] : text['no'],
          style: TextStyle(
              color: ThemeManager.of(context).colorSet.intermediaryColor,
          fontSize: kPlayAgainButtonFontSize,
          fontFamily: 'Cyrulik'),
        ),
      ),
    );
  }
}
