import 'package:flutter/material.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primaryWhiteColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryWhiteColor,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      titleTextStyle: AppTextStyles.styleW500S20.copyWith(
        color: AppColors.primaryBlackColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryBlackColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlackColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryBlackColor,
      foregroundColor: AppColors.primaryWhiteColor,
      titleTextStyle: AppTextStyles.styleW500S20.copyWith(
        color: AppColors.primaryWhiteColor,
      ),
    ),
  );
}
