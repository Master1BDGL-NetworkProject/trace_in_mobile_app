import 'package:flutter/material.dart';

import '../sizes/app_sizes.dart';
import 'app_colors.dart';
import 'app_theme_interface.dart';

class LightAppTheme implements IAppTheme {
  // Define theme for "light theme"

  static final ThemeData _theme = ThemeData(
      primaryColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.lightGrey,
      fontFamily: 'IBM Plex',
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: AppSizes.header1,
              color: AppColors.headerTextBlack,
              fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
              fontSize: AppSizes.paragraph2,
              color: AppColors.darkBlack,
              fontWeight: FontWeight.w300),
          titleMedium: TextStyle(
              fontSize: AppSizes.paragraph2,
              color: AppColors.darkBlack,
              fontWeight: FontWeight.w700),
          bodySmall: TextStyle(
              fontSize: AppSizes.paragraph1,
              color: AppColors.darkBlack,
              fontWeight: FontWeight.w300),
          displayMedium: TextStyle(
              fontSize: AppSizes.paragraph2,
              color: AppColors.darkBlack,
              fontWeight: FontWeight.w700)),
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
          colorScheme: const ColorScheme.light(
            background: AppColors.blue,
            secondary: AppColors.darkBlack,
          )),
      colorScheme: ColorScheme.light(
          background: AppColors.lightGrey,
          brightness: Brightness.light,
          error: AppColors.lightOrange,
          primary: AppColors.white,
          secondary: AppColors.blue,
          primaryContainer: AppColors.lightOrange,
          tertiary: AppColors.darkestBlack,
          secondaryContainer: AppColors.lightOrange));

  @override
  ThemeData get theme => _theme;
}
