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
      borderColor: Colors.black),
  ThemeColorSet(
      name: 'theme3',
      primaryColor: klDarkPrimary,
      secondaryColor: klDarkerYellow,
      intermediaryColor: klDarkIntermediary,
      strongestColor: klBrightYellow,
      borderColor: Colors.white),
  ThemeColorSet(
      name: 'theme4',
      primaryColor: klDarkPrimary,
      secondaryColor: klAbsoluteWhite,
      intermediaryColor: klDarkIntermediary,
      strongestColor: klDarkerWhite,
      borderColor: Colors.white,
      usedHintColor: Colors.black26),
  ThemeColorSet(
      name: 'theme5',
      primaryColor: klAbsoluteWhite,
      secondaryColor: klDarkIntermediary,
      intermediaryColor: klDarkerWhite,
      strongestColor: klDarkPrimary,
      borderColor: Colors.black),
  ThemeColorSet(
      name: 'theme6',
      primaryColor: klAutumnRed,
      secondaryColor: klAutumnYellow,
      intermediaryColor: klAutumnBrown,
      strongestColor: klAutumnOrange,
      borderColor: Colors.white)
];