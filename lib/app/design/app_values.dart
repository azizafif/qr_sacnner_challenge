import 'package:flutter/material.dart';

class AppValues {
  AppValues._();

  //? Scaffold
  static const double bodyTopPadding = 50;
  static const double bodyBottomPadding = 50;
  static const double bodyMinSymetricHorizontalPadding = 25;
  static const double bodyMaxSymetricHorizontalPadding = 32;

  //? Bottom Navigation bar
  static BottomNavigationBarType bottomNavBarType =
      BottomNavigationBarType.fixed;
  static const double bottomNavBarHeight = 70;
  static const double bottomNavBarSelectedLabelFontSize = 10;
  static const double bottomNavBarUnselectedLabelFontSize = 10;
  static const double bottomNavBarRadius = 0;
  static const double bottomNavBarBlurRadius = 1;
  static const double bottomNavBarIconSize = 20;

  //? Elevated button
  static const double elevatedButtonElevation = defaultElevation;
  static const double elevatedButtonRadius = defaultRadius;
  static const double elevatedButtonHeight = 52;

  //? Cards
  static const double cardElevation = defaultElevation;
  static const double cardRadius = defaultRadius;
  static const double cardIconSize = 36;

  //? list Tiles
  static const double listTileRadius = defaultRadius;

  //? Logo
  static const double logoSize = 75;

  //? Api Error Widget
  static const double apiErrorWidgetImageSize = 100;

  //$ Default Radius
  static const double defaultRadius = 8;

  //$ Elevation
  static const double defaultElevation = 1;
  //& UI assertions
  static void performUserInterfaceValuesAssertions() {
    assert(
      defaultElevation <= 3,
      '\n[defaultElevation] defaultElevation must be <= 3',
    );
    assert(
      defaultRadius <= 20,
      '\n[defaultElevation] defaultRadius must be <= 20',
    );
  }
}
