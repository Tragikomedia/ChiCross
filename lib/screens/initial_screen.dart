import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/screens/selection_screen.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<bool> _databaseLoaded;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _databaseLoaded,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
        if (snapshot.hasData) {
          return Center(
            child: Container(
              child: RaisedButton(onPressed: () async {
     Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));},),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('ERROR');
        } else {
            _databaseLoaded = Provider.of<ProgressProvider>(context).initializeDatabase();
          return Text('Lelum polelum');
        }
      },
    );
  }
}


