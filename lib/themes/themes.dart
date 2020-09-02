import 'package:chinese_picross/utilities/general_utils/color_themes.dart';
import 'package:chinese_picross/utilities/models/theme_color_set.dart';
import 'package:flutter/material.dart';

List<ThemeColorSet> themes = [
  ThemeColorSet(
      name: 'theme0',
      primaryColor: klWhite,
      secondaryColor: klSpaceCherry,
      intermediaryColor: klWhiteDark,
      strongestColor: klSpaceCherryDark,
      borderColor: Colors.black),
  ThemeColorSet(
      name: 'theme1',
      primaryColor: klSweetCorn,
      secondaryColor: klToffee,
      intermediaryColor: klSweetCornDark,
      strongestColor: klToffeeDark,
      borderColor: Colors.black),
  ThemeColorSet(
      name: 'theme2',
      primaryColor: klFairOrange,
      secondaryColor: klPurpleBlue,
      intermediaryColor: klFairOrangeDark,
      strongestColor: klPurpleBlueDark,
      borderColor: Colors.black)
];