import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadtplan/presentation/widgets/components/button_primary.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class AppTheme {
  static ThemeData androidTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Palette.primary,
        onPrimary: Palette.white,
        secondary: Palette.primary,
        onSecondary: Palette.white,
        surface: Palette.white,
        onSurface: Palette.greyDark,
        error: Palette.error,
        onError: Palette.white,
        background: Palette.obsolete,
        onBackground: Palette.greyDark,
      ),
      primaryColor: Palette.primary,
      highlightColor: Palette.primary.withAlpha(Palette.opacity20),
      splashColor: Palette.primary.withAlpha(Palette.opacity20),
      fontFamily: TextStyles.fontFamily,
      scaffoldBackgroundColor: Palette.obsolete,
      textTheme: TextTheme(
        labelLarge: TextStyles.paragraphRegular(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primary,
          minimumSize: Size(
            88,
            ButtonPrimary.defaultHeight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 2,
        ),
      ),
      cupertinoOverrideTheme: cupertinoTheme(),
      cardTheme: const CardTheme(
        elevation: 1,
        color: Palette.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Palette.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const _NoUnderlineInputBorder(),
        fillColor: Palette.white,
        contentPadding: const EdgeInsets.all(Spacings.medium),
        filled: true,
        hintStyle: TextStyles.header4Regular(color: Palette.grey50),
        floatingLabelStyle: TextStyles.smallRegular(),
        labelStyle: TextStyles.header4Regular(color: Palette.grey50),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Palette.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyles.h3Black.copyWith(
          fontFamily: TextStyles.fontFamily,
        ),
        iconTheme: IconThemeData(color: Palette.secondary),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: Palette.obsolete,
      ),
    );
  }

  static CupertinoThemeData cupertinoTheme() {
    return CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: Palette.primary,
      primaryContrastingColor: Palette.primary,
      scaffoldBackgroundColor: Palette.obsolete,
      barBackgroundColor: Palette.obsolete,
      textTheme: CupertinoTextThemeData(
        primaryColor: Palette.greyDark,
        dateTimePickerTextStyle:
            TextStyle(color: Palette.greyDark, fontSize: 23),
      ),
    );
  }
}

class _NoUnderlineInputBorder extends UnderlineInputBorder {
  const _NoUnderlineInputBorder()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide.none,
        );
}
