import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/grid_provider.dart';
import 'package:chinese_picross/components/game_comps/grid/grid_box.dart';
import 'package:chinese_picross/components/game_comps/finished_game/finished_game_view.dart';
import 'package:chinese_picross/components/game_comps/top_bar/information_bar.dart';
import 'package:chinese_picross/components/game_comps/game_app_bar/game_app_bar.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class GameScreen extends StatefulWidget {
  final int gameNumber;

  GameScreen({@required this.gameNumber});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var gridProvider = Provider.of<GridProvider>(context, listen: false);
    var colorSet = ThemeManager.of(context).colorSet;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kPreferredAppBarHeight),
            child: GameAppBar(
              gameNumber: widget.gameNumber,
              textColor: colorSet.strongestColor,
              backgroundColor: colorSet.intermediaryColor,
            )),
        backgroundColor: colorSet.primaryColor,
        body: SafeArea(
          child: ValueListenableBuilder<bool>(
            valueListenable: gridProvider.isFinished,
            builder: (BuildContext context, bool isFinished, Widget child) {
              return isFinished
                  ? FinishedGameView(
                      gameNumber: widget.gameNumber,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          InformationBar(
                            gameNumber: widget.gameNumber,
                            mainColor: colorSet.primaryColor,
                            sideColor: colorSet.secondaryColor,
                          ),
                          GridBox(
                            width: gridProvider.width,
                            height: gridProvider.height,
                          ),
                        ]);
            },
          ),
        ));
  }
}
