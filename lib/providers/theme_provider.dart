import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  int _themeNumber = 0;

  void changeThemeNumber() {
    _themeNumber = _themeNumber != themes.length - 1 ? _themeNumber + 1 : 0;
    notifyListeners();
    saveTheme();
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeNumber = (prefs.getInt('theme') ?? 0);
    notifyListeners();
  }

  void saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', _themeNumber);
  }

  ThemeData get themeData {
    return themes[_themeNumber];
  }
}