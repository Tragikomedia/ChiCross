import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';

class VictoryView extends StatelessWidget {
  final int gameNumber;

  VictoryView({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    var progressProvider = Provider.of<ProgressProvider>(context, listen: false);
    return Column(children: [Text('Victory'), RaisedButton(child: Text('Go back'),onPressed: () {
      progressProvider.markCompleted(gameNumber);
      progressProvider.eraseLevelProgress(gameNumber);
      Navigator.pop(context);
    },)]);
  }
}
