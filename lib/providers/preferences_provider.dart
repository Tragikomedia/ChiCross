import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/themes.dart';
import 'package:chinese_picross/utilities/models/theme_color_set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  int _themeNumber = 0;
  int _lives = 5;
  bool _autosaveOn = true;
  String _language = 'en';
  bool _choseLanguage = false;

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeNumber = (prefs.getInt('theme') ?? 0);
    _lives = (prefs.getInt('lives') ?? 5);
    _autosaveOn = (prefs.getBool('autosave') ?? true);
    _language = (prefs.getString('language') ?? 'en');
    _choseLanguage = (prefs.getBool('choseLanguage') ?? false);
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

  bool get choseLanguage {
    return _choseLanguage;
  }

  void chooseLanguageOnStart(String lang) {
    _language = lang;
    _choseLanguage = true;
    _saveChosenLanguage();
  }

  void _saveChosenLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', _language);
    await prefs.setBool('choseLanguage', _choseLanguage);
    notifyListeners();
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

  void changeLanguage() async {
    _language = _language == 'en' ? 'pl' : 'en';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', _language);
    notifyListeners();
  }

  String get language {
    return _language;
  }

}