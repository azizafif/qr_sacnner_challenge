import 'package:flutter/material.dart';

import 'index.dart';

class AppThemes {
  AppThemes._();

  static ThemeMode themeMode = ThemeMode.light;

  //? LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    //? Colors
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    primaryColor: AppColors.primaryColor,

    //& Card
    cardTheme: const CardTheme(
      color: AppColors.listTileColor,
      elevation: AppValues.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(AppValues.listTileRadius)),
      ),
    ),

    // //? List Tile
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black,
      contentPadding: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(AppValues.listTileRadius)),
      ),
      tileColor: AppColors.listTileColor,
    ),
  );
}
