import 'package:flutter/material.dart';
import 'package:chinese_picross/screens/game_screen.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatelessWidget {
  final int gameNumber;
  final List saveData;
  final Color textColor;
  final Color backgroundColor;

  PlayButton({@required this.gameNumber, @required this.backgroundColor, @required this.textColor, this.saveData});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor,
      child: Text(
          (saveData == null) ? 'START' : localization[Provider.of<PreferencesProvider>(context, listen: false).language]['selection']['load'],
          style: TextStyle(
            color: textColor,
            fontFamily: 'Cyrulik',
            fontSize: kPlayButtonFontSize
          ),),
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(create: (context) => GridProvider(
            game: picrossList[gameNumber].game, lives: (saveData == null) ? Provider.of<PreferencesProvider>(context, listen: false).lives : saveData[2],
            loadSaveFile: (saveData == null) ? false : true,
            saveData: saveData),child:GameScreen(gameNumber: gameNumber,))));
    },);
  }
}
