
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_field_theme.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    // appBarTheme: AppBarThemes.lighAppBarTheme,
    // elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: OutlinedButtonThemes.lighOutlinedButtonThemes,
     inputDecorationTheme: TextFormFieldThemes.lightInputDecorationTheme,
  );

  // static ThemeData darkTheme = ThemeData(
  //   scaffoldBackgroundColor: AppColors.dark,
  //   brightness: Brightness.dark,
  //   textTheme: AppTextTheme.darkTextTheme,
  //   appBarTheme: AppBarThemes.darkAppBarTheme,
  //   elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  //   outlinedButtonTheme: OutlinedButtonThemes.darkOutlinedButtonTheme,
  //   inputDecorationTheme: TextFormFieldThemes.darkInputDecorationTheme,
  // );
}