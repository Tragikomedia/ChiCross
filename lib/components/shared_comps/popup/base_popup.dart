import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class BasePopup extends StatelessWidget {
  final Widget textWidget;
  final Widget choiceWidget;

  BasePopup({@required this.textWidget, @required this.choiceWidget});

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return SimpleDialog(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),),
      backgroundColor: colorSet.primaryColor,
      title: textWidget,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: choiceWidget,
          ),]
        );
  }
}