import 'package:flutter/material.dart';
import 'package:chinese_picross/components/menu_comps/main_menu.dart';
import 'package:chinese_picross/components/menu_comps/logo.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Logo()),
              Flexible(
                  child: MainMenu())
            ]) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Logo()),
              Flexible(
                  child: MainMenu())
            ]);
      },
    );
  }
}
