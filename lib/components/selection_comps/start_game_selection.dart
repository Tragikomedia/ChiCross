import 'package:flutter/material.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/components/selection_comps/play_button.dart';
import 'package:provider/provider.dart';

class StartGameSelection extends StatefulWidget {
  final int gameNumber;

  StartGameSelection({@required this.gameNumber});

  @override
  _StartGameSelectionState createState() => _StartGameSelectionState();
}

class _StartGameSelectionState extends State<StartGameSelection> {
  Future<List> _saveState;

  void loadSaveState(BuildContext context) {
    setState(() {
      _saveState = Provider.of<ProgressProvider>(context, listen: false).retrieveLevelProgress(widget.gameNumber);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadSaveState(context));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _saveState, builder: (BuildContext context, AsyncSnapshot<List> snapshot){
      if (snapshot.hasData && snapshot.data.isNotEmpty) {
        return Row(children: [
          PlayButton(gameNumber: widget.gameNumber,),
        PlayButton(gameNumber: widget.gameNumber, saveData: snapshot.data,)],);
      } else {
        return PlayButton(gameNumber: widget.gameNumber,);
      }
    },);
  }
}
