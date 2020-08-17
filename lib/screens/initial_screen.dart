import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/screens/selection_screen.dart';
import 'package:chinese_picross/screens/settings_screen.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<bool> _databaseLoaded;
  void initDbAndPref(BuildContext context) {
    setState(() {
      _databaseLoaded = Provider.of<ProgressProvider>(context,listen: false).initializeDatabase();
    });
    Provider.of<PreferencesProvider>(context, listen: false).loadPreferences();
  }
  @override
  void initState() {
    super.initState();
    // It's the only not terrible way to link future builder to provider
    WidgetsBinding.instance.addPostFrameCallback((_) => initDbAndPref(context));
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO put Scaffold etc above if
    var colorSet = ThemeManager.of(context).colorSet;
    return Scaffold(
      backgroundColor: colorSet.primaryColor,
      body: SafeArea(
        child: FutureBuilder<bool>(
      future: _databaseLoaded,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Center(
                child: Container(
                  child: Column(
                    children: [RaisedButton(child: Text('Play', style: TextStyle(color: colorSet.primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),), color: colorSet.secondaryColor,onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));},),
                      RaisedButton(child: Text('Settings', style: TextStyle(color: colorSet.primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),), color: colorSet.secondaryColor, onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                      },),],
                  ),
                ),
              );
        } else if (snapshot.hasError) {
          return Text('ERROR');
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: colorSet.strongestColor,
            ),
          );
        }
      },
    ),
    ),
    );
  }
}


