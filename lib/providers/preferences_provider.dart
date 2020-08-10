import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  int _themeNumber = 0;
  bool _autosaveOn = true;

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeNumber = (prefs.getInt('theme') ?? 0);
    _autosaveOn = (prefs.getBool('autosave') ?? false);
    notifyListeners();
  }

  void changeThemeNumber() {
    _themeNumber = _themeNumber != themes.length - 1 ? _themeNumber + 1 : 0;
    notifyListeners();
    saveTheme();
  }

  void saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', _themeNumber);
  }

  ThemeData get themeData {
    return themes[_themeNumber];
  }

  void toggleAutosave() async {
    _autosaveOn = !_autosaveOn;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('autosave', _autosaveOn);
    print(_autosaveOn);
  }

  bool get autosaveOn {
    return _autosaveOn;
  }

}