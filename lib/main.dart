import 'package:flutter/material.dart';
import 'package:chinese_picross/screens/initial_screen.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context) => PreferencesProvider(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(create: (context) => ProgressProvider(),
    child: MaterialApp(
      title: 'ChiCross',
      theme: Provider.of<PreferencesProvider>(context).themeData,
      home:  InitialScreen(),)
    );
  }
}

