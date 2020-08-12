import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class TryAgainMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Do you want to try again?', style: TextStyle(fontSize: kTryAgainFontSize, color: ThemeManager.of(context).colorSet.secondaryColor, fontFamily: 'Cyrulik'),textAlign: TextAlign.center,);
  }
}
