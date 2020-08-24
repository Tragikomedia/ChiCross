import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/components/menu_comps/menu_view.dart';
import 'package:chinese_picross/components/menu_comps/error_text.dart';
import 'package:flushbar/flushbar.dart';

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
    var colorSet = ThemeManager.of(context).colorSet;
    return Scaffold(
      backgroundColor: colorSet.primaryColor,
      body: SafeArea(
        child: FutureBuilder<bool>(
      future: _databaseLoaded,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return MenuView();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorText(
              color: colorSet.strongestColor,
            ),
          );
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



