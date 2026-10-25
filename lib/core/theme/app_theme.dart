import 'package:flowery_e_commerce/core/constants/app_colors.dart';
import 'package:flowery_e_commerce/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.pink,
      onPrimary: AppColors.white[70]!,
      secondary: AppColors.lightPink,
      onSecondary: AppColors.white[90]!,
      error: AppColors.red,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),

    textTheme: TextTheme(
      // displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.black),
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: AppColors.black,
      ),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.white[90],
      ),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.black),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.black),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.black),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.black),
labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.black,decorationColor: AppColors.black),
      displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.black),
    ),
    appBarTheme: AppBarThemeData(
      centerTitle: true,
      titleTextStyle: AppTextStyles.headlineLarge.copyWith(
        color: AppColors.black,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
       splashRadius: 0,
      side: BorderSide(
        color: AppColors.white[90]!,
      ),

    )
  );
}
