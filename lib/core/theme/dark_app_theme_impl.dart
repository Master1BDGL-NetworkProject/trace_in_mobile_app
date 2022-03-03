import 'package:flutter/material.dart';

import '../sizes/app_sizes.dart';
import 'app_colors.dart';
import 'app_theme_interface.dart';

class DarkAppTheme implements IAppTheme {
  // Define theme for "light theme"

  static final ThemeData _theme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkestBlack,
      fontFamily: 'IBM Plex',
      textTheme: TextTheme(
        headlineMedium: const TextStyle(
            fontSize: AppSizes.header1,
            color: AppColors.white,
            fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(
            fontSize: AppSizes.paragraph2,
            color: AppColors.diminishedWhite,
            fontWeight: FontWeight.w300),
        bodySmall: TextStyle(
            fontSize: AppSizes.paragraph1,
            color: AppColors.diminishedWhite,
            fontWeight: FontWeight.w300),
      ),
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
          colorScheme: const ColorScheme.dark(
            background: AppColors.blue,
          )),
      colorScheme: ColorScheme.dark(
          background: AppColors.darkestBlack,
          brightness: Brightness.dark,
          error: AppColors.lightOrange,
          primary: AppColors.lightBlack,
          secondary: AppColors.darkBlue,
          primaryContainer: AppColors.darkBlue,
          tertiary: AppColors.white,
          secondaryContainer: AppColors.lightOrange));

  @override
  ThemeData get theme => _theme;
}
