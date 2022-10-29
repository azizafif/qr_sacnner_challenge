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
    splashColor: AppColors.splashColor,
    highlightColor: Colors.transparent,
    errorColor: AppColors.errorColor,
    hoverColor: AppColors.successColor,
    dividerColor: AppColors.dividerColor,
    dialogBackgroundColor: AppColors.scaffoldColor,
    cardColor: AppColors.cardColor,
    hintColor: AppColors.hintColor,
    shadowColor: AppColors.shadowColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    focusColor: AppColors.focusColor,
    canvasColor: AppColors.scaffoldColor,

    //? Card
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: AppColors.shadowColor,
      elevation: AppValues.cardElevation,
      margin: EdgeInsets.symmetric(horizontal: AppValues.cardElevation),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppValues.cardRadius)),
      ),
    ),

    //? Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(AppColors.splashColor),
        shadowColor: MaterialStateProperty.all(AppColors.shadowColor),
        elevation: MaterialStateProperty.all(AppValues.elevatedButtonElevation),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(AppValues.elevatedButtonRadius)))),
        // textStyle: MaterialStateProperty.all(AppStyles.textButtonTitleTextStyle),
        minimumSize: MaterialStateProperty.all(
            const Size.fromHeight(AppValues.elevatedButtonHeight)),
      ),
    ),

    //? List Tile
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.primaryColor,
      textColor: AppColors.primaryColor,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      style: ListTileStyle.drawer,
      enableFeedback: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(AppValues.listTileRadius)),
      ),
      tileColor: Colors.transparent,
    ),
  );
}
