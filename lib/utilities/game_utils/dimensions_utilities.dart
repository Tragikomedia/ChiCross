import 'package:flutter/cupertino.dart';

double gridHeight(BuildContext context, int width, int height) {
  // Proportions come from stagTiles, offset for hint tiles
  return MediaQuery.of(context).size.width * (height + 3)/(width + 2);
}

double informationBarHeight(BuildContext context, int width, int height) {
  return MediaQuery.of(context).size.height - gridHeight(context, width, height);
}

double gameFontSize(BuildContext context, int width, int height) {
  return MediaQuery.of(context).size.width * ((height + 3)/(width + 2))/27 - 0.4;
}
double informationBarFontSize(BuildContext context, int width, int height) {
  return informationBarHeight(context, width, height) / 20;
}
