import 'package:chinese_picross/utilities/models/theme_color_set.dart';
import 'package:flutter/material.dart';

class ThemeManager extends InheritedWidget {
  final ThemeColorSet colorSet;

  ThemeManager({@required this.colorSet, @required Widget child}) :super(child: child);

  static ThemeManager of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeManager>();
  }

  @override
  bool updateShouldNotify(ThemeManager old) => colorSet != colorSet;
}