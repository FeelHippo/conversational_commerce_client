import 'package:flutter/material.dart';

class TextStyles {
  static String fontFamily = 'urbanist';

  // display large
  static TextStyle displayLarge() => TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1,
      );

  // display small
  static TextStyle displaySmall() => TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1,
      );

  // headline large
  static TextStyle headlineLarge() => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 0.9,
      );

  // headline medium
  static TextStyle headlineMedium() => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1,
      );

  // headline small
  static TextStyle headlineSmall() => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1,
      );

  // title medium > w600
  static TextStyle titleMedium() => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1,
      );

  // body large > w500
  static TextStyle bodyLarge({
    FontWeight? fontWeight,
    Color? color,
  }) =>
      TextStyle(
        fontSize: 17,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1,
        color: color,
      );

  static TextStyle paragraph({Color? color}) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 1,
        color: color,
      );

  // used by the text field
  static TextStyle textFieldLabel({
    Color? color,
    FontWeight? fontWeight,
    bool isTextBold = false,
  }) =>
      TextStyle(
        color: color,
        fontSize: 16,
        height: 1,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  // label medium > w500
  static TextStyle labelMedium({
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: 13,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 1,
      );

  // label small
  static TextStyle labelSmall() => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        letterSpacing: 2,
        height: 1,
      );
}
