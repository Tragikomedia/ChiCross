import 'package:flutter/material.dart';
import 'package:chinese_picross/screens/initial_screen.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(create: (context) => PreferencesProvider(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(create: (context) => ProgressProvider(),
    child: ThemeManager(colorSet: Provider.of<PreferencesProvider>(context).themeData,
        child: MaterialApp(
      title: 'ChiCross',
      home: InitialScreen(),))
    );
  }
}

