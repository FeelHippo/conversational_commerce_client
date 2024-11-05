import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/utils/dotenv_utils.dart';

class TextStyles {
  static String fontFamily = DotenvUtils.getString('FONT_FAMILY');

  static const TextStyle h2Black = TextStyle(
    color: Palette.black,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.1,
  );

  static TextStyle h2Primary({required Color color}) => TextStyle(
        color: color,
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1.1,
      );

  static TextStyle h3PrimaryBold({required Color color}) => TextStyle(
        color: color,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static const TextStyle h3DarkBlackCentered = TextStyle(
    color: Palette.dark_333333,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    height: 1.3181818181818181,
  );

  static const TextStyle h3Black = TextStyle(
    color: Palette.black,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.3181818181818181,
  );

  static const TextStyle h4BoldDarkBlack = TextStyle(
    color: Palette.dark_333333,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.3333333333333333,
  );

  static const TextStyle h4BoldDarkGrey = TextStyle(
    color: Palette.grey_main_575757,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.3333333333333333,
  );

  static const TextStyle h4NormalDarkGrey = TextStyle(
    color: Palette.grey_main_575757,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.3333333333333333,
  );

  static const TextStyle h4NormalGreyCentered = TextStyle(
    color: Palette.grey_50_ababab,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    height: 1.3333333333333333,
  );

  static const TextStyle h4NormalBlack = TextStyle(
    color: Palette.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.3333333333333333,
  );

  static TextStyle lauftextBoldError = TextStyle(
    color: Palette.error,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle lauftextBoldBlack = TextStyle(
    color: Palette.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle lauftextNormalGreyMain = TextStyle(
    color: Palette.grey_main_575757,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    height: 1.4375,
  );

  static TextStyle lauftextNormalPrimary = TextStyle(
    color: Palette.primary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle lauftextNormalGreyCentered = TextStyle(
    color: Palette.grey_50_ababab,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    height: 1.4375,
  );

  static const TextStyle lauftextNormalBlack = TextStyle(
    color: Palette.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle lauftextNormalGrey = TextStyle(
    color: Palette.grey_50_ababab,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle lauftextNormalDarkGrey = TextStyle(
    color: Palette.grey_main_575757,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle paragraphBoldBlack = TextStyle(
    color: Palette.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle paragraphNormalGrey = TextStyle(
    color: Palette.obsolete_aaaaaa_obsolete,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.4375,
  );

  static const TextStyle bodyTextNormalBlack = TextStyle(
    color: Palette.dark_333333,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.3333333333333333,
  );

  static const TextStyle smallGrey = TextStyle(
    color: Palette.grey_50_ababab,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.2142857142857142,
  );

  static const TextStyle captionNormalBlack = TextStyle(
    color: Palette.dark_333333,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.3333333333333333,
  );

  static const TextStyle lauftextTinyRegularDarkBlack = TextStyle(
    color: Palette.dark_333333,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  /// New Styles
  static TextStyle header1({Color? color, FontWeight? fontWeight}) => TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 42,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1.1904761904761905,
      );

  static TextStyle header2({Color? color, FontWeight? fontWeight}) => TextStyle(
        color: color ?? Palette.greyDark,
        fontSize: 30,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1.1,
      );

  static TextStyle header3({Color? color, FontWeight? fontWeight}) => TextStyle(
        color: color ?? Palette.greyDark,
        fontSize: 22,
        height: 1.3181818181818181,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static TextStyle header4Bold({
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 18,
        height: height ?? 1.3333333333333333,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static TextStyle header4Regular({Color? color, bool isTextBold = false}) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 18,
        height: 1.3333333333333333,
        fontWeight: isTextBold ? FontWeight.w700 : FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle paragraphBold({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 16,
        decoration: textDecoration,
        height: 1.4375,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static TextStyle paragraphRegular({
    Color? color,
    FontWeight? fontWeight,
    double? height = 1.4375,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 16,
        decoration: textDecoration,
        height: height ?? 1.4375,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle smallBold({Color? color, FontWeight? fontWeight}) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 14,
        height: 1.3333333333333333,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static TextStyle smallRegular({Color? color, FontWeight? fontWeight}) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 14,
        height: 1.3333333333333333,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle tinyBold({
    Color? color,
    FontWeight? fontWeight,
    double? textSize = 10,
  }) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: textSize,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
      );

  static TextStyle tinyRegular({
    Color? color,
    FontWeight? fontWeight,
    double? textSize = 10,
  }) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: textSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle textFieldLabel({
    Color? color,
    FontWeight? fontWeight,
    bool isTextBold = false,
  }) =>
      TextStyle(
        color: color ?? Palette.greyMain,
        fontSize: 18,
        height: 1.3333333333333333,
        fontWeight: isTextBold ? FontWeight.w700 : FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle textFieldHint({Color? color, FontWeight? fontWeight}) =>
      TextStyle(
        color: color ?? Palette.grey50,
        fontSize: 14,
        height: 1.3333333333333333,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  static TextStyle buttonPrimary({Color? textColor, FontWeight? fontWeight}) =>
      header4Bold(color: textColor, fontWeight: fontWeight);

  static TextStyle buttonSecondary({
    Color? textColor,
    bool isTextBold = false,
  }) =>
      paragraphRegular(
        color: textColor,
        fontWeight: isTextBold ? FontWeight.w700 : FontWeight.w400,
      );

  static TextStyle bottomMenuText({
    Color? textColor,
  }) =>
      TextStyle(
        color: textColor ?? Palette.primary,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      );
}
