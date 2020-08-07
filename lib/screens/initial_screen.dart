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
  Future<bool> initDb() async {
    return await Provider.of<ProgressProvider>(context).initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _databaseLoaded = initDb();
    });
    return FutureBuilder<bool>(
      future: _databaseLoaded,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Container(
              child: RaisedButton(onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));},),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('ERROR');
        } else {
          print('reached before init');

            print('reached after init');
          return Text('Lelum polelum');
        }
      },
    );
  }
}


