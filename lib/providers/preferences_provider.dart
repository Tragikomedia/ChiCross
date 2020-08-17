import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/themes.dart';
import 'package:chinese_picross/utilities/models/theme_color_set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  int _themeNumber = 0;
  int _lives = 5;
  bool _autosaveOn = true;

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeNumber = (prefs.getInt('theme') ?? 0);
    _lives = (prefs.getInt('lives') ?? 5);
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

  ThemeColorSet get themeData {
    return themes[_themeNumber];
  }

  void changeNumberOfLives() async {
    if (_lives == 5) {
      _lives = -1;
    } else if (_lives == -1) {
      _lives = 1;
    } else {
      _lives++;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lives', _lives);
    notifyListeners();
  }

  int get lives {
    return _lives;
  }

  void toggleAutosave() async {
    _autosaveOn = !_autosaveOn;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('autosave', _autosaveOn);
    notifyListeners();
  }

  bool get autosaveOn {
    return _autosaveOn;
  }

}