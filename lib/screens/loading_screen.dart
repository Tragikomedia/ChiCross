import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/screens/selection_screen.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: RaisedButton(onPressed: () async {
      await Provider.of<ProgressProvider>(context, listen: false).initializeDatabase();
      Provider.of<ProgressProvider>(context, listen: false).getProgress();
      print('Moving');
      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));
    },),),);
  }
}

