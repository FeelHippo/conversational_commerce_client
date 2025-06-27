import 'package:conversational_commerce/themes/constants/palette.dart';
import 'package:conversational_commerce/themes/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.1,
    ),
    displayMedium: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.1,
    ),
    displaySmall: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.1,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.2,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.2,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.2,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.2,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.2,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.2,
      height: 1.4,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.2,
      height: 1.4,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      height: 1.4,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      height: 1.4,
    ),
  );

  static FloatingActionButtonThemeData floatingActionButtonTheme =
      FloatingActionButtonThemeData(
    disabledElevation: 0,
    elevation: 0,
    foregroundColor: Palette.contentAlwaysWhite,
  );

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: TextStyles.fontFamily,
      textTheme: textTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Palette.brandPrimary,
        onPrimary: Palette.contentPrimary,
        secondary: Palette.contentNegative,
        onSecondary: Palette.contentSecondary,
        surface: Palette.background,
        onSurface: Palette.contentAlwaysBlack,
        surfaceContainerHighest: Palette.surface0,
        surfaceContainerHigh: Palette.surface1,
        surfaceContainerLow: Palette.surface2,
        surfaceContainerLowest: Palette.surface3,
        tertiary: Palette.contentTertiary,
        error: Palette.contentNegative,
        onError: Palette.contentAlwaysWhite,
        surfaceTint: Palette.transparentOverlay.withOpacity(0.75),
      ),
      primaryColor: Palette.brandPrimary,
      scaffoldBackgroundColor: Palette.background,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Palette.transparentOverlay.withOpacity(0.75),
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Palette.brandPrimary,
          onPrimary: Palette.contentPrimary,
          secondary: Palette.secondaryButton,
          onSecondary: Palette.secondaryButtonContent,
          tertiary: Palette.contentAlwaysWhite,
          onTertiary: Palette.secondaryButtonContent,
          error: Palette.contentNegative,
          onError: Palette.contentAlwaysWhite,
          surface: Palette.background,
          onSurface: Palette.contentAlwaysWhite,
          surfaceTint: Palette.secondaryButton,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Palette.brandPrimary,
      ),
      cupertinoOverrideTheme: cupertinoLightTheme(),
    );
  }

  static CupertinoThemeData cupertinoLightTheme() {
    return CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: Palette.brandPrimary,
      primaryContrastingColor: Palette.contentAlwaysWhite,
      scaffoldBackgroundColor: Palette.background,
    );
  }
}
