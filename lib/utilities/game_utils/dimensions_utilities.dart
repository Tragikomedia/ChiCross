import 'package:flutter/cupertino.dart';

double gridHeight(BuildContext context, int width, int height) {
  // Proportions come from stagTiles, offset for hint tiles
  return MediaQuery.of(context).size.width * (height + 3)/(width + 2);
}

double gameFontSize(BuildContext context, int width, int height) {
  return MediaQuery.of(context).size.width * ((height + 3)/(width + 2))/27;
}
