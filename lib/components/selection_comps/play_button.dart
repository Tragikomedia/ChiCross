import 'package:flutter/material.dart';
import 'package:chinese_picross/screens/game_screen.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatelessWidget {
  final int gameNumber;
  final List<List<int>> saveData;

  PlayButton({@required this.gameNumber, this.saveData});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(child: Text((saveData == null) ? 'PLAY' : 'FROM SAVE') ,onPressed: () {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(create: (context) => GridProvider(
          game: picrossList[gameNumber].game, loadSaveFile: (saveData == null) ? false : true, saveData: saveData),child:GameScreen(gameNumber: gameNumber,))));
    },);
  }
}
