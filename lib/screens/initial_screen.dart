import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/theme_provider.dart';
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
    // TODO put Scaffold etc above if
    return FutureBuilder<bool>(
      future: _databaseLoaded,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Center(
              child: Container(
                child: Column(
                  children: [RaisedButton(child: Text('Play', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),), color: Theme.of(context).accentColor,onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));},), RaisedButton(child: Text('Color', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),), color: Theme.of(context).accentColor, onPressed: () {
       Provider.of<ThemeProvider>(context, listen: false).changeThemeNumber();
                  },)],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('ERROR');
        } else {
          Provider.of<ThemeProvider>(context).loadTheme();
          return Scaffold(body: Text('Lelum polelum'), backgroundColor: Theme.of(context).accentColor,);
        }
      },
    );
  }
}


