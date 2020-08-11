import 'package:chinese_picross/utilities/game_utils/dimensions_utilities.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class CrossIcon extends StatelessWidget {
  final int height;
  final int width;

  CrossIcon({@required this.height, @required this.width});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.clear, size: gameFontSize(context, width, height)*kIconSizeModifier,);
  }
}
