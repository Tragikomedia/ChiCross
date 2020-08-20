import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/themes/theme_manager.dart';

class TutorialImage extends StatelessWidget {
  final String imageAddress;

  TutorialImage({@required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: ThemeManager.of(context).colorSet.strongestColor, width: 3.0)),
          child: Image(
            image: AssetImage(imageAddress),
          )),
    );
  }
}
