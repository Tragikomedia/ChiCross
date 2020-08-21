import 'package:flutter/material.dart';
import 'package:chinese_picross/components/menu_comps/main_menu.dart';
import 'package:chinese_picross/components/menu_comps/logo.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Logo()),
          Flexible(
              child: MainMenu())
        ]);
  }
}