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
  void initDb(BuildContext context) {
    setState(() {
      _databaseLoaded = Provider.of<ProgressProvider>(context,listen: false).initializeDatabase();
    });
  }
  @override
  void initState() {
    super.initState();
    // It's the only not terrible way to link future builder to provider
    WidgetsBinding.instance.addPostFrameCallback((_) => initDb(context));
  }
  
  @override
  Widget build(BuildContext context) {
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
          return Text('Lelum polelum');
        }
      },
    );
  }
}


