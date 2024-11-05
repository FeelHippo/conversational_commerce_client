import 'package:flutter/material.dart';
import 'package:stadtplan/utils/dotenv_utils.dart';

class Palette {
  static Color primary = parseEnvValue('PRIMARY');
  static Color secondary = parseEnvValue('SECONDARY');
  static Color error = parseEnvValue('ERROR');
  static Color success = parseEnvValue('SUCCESS');
  static Color warning = parseEnvValue('WARNING');
  static Color appScaffoldColor = parseEnvValue('APP_SCAFFOLD_COLOR');
  static Color appCardColor = parseEnvValue('APP_CARD_COLOR');
  static Color greyMain = parseEnvValue('GREY_MAIN');
  static Color greyDark = parseEnvValue('GREY_DARK');
  static Color grey80 = parseEnvValue('GREY_80');
  static Color grey50 = parseEnvValue('GREY_50');
  static Color grey20 = parseEnvValue('GREY_20');
  static Color grey10 = parseEnvValue('GREY_10');
  static Color grey05 = parseEnvValue('GREY_05');
  static Color buttonBgColor = parseEnvValue('BUTTON_BG_COLOR');
  static Color buttonTextColor = parseEnvValue('BUTTON_TEXT_COLOR');
  static Color buttonSecondaryBgColor =
      parseEnvValue('BUTTON_SECONDARY_BG_COLOR');
  static Color buttonSecondaryTextColor =
      parseEnvValue('BUTTON_SECONDARY_TEXT_COLOR');

  static Color switchOnBackgroundColor =
      parseEnvValue('SWITCH_ON_BACKGROUND_COLOR');
  static Color switchOffBackgroundColor =
      parseEnvValue('SWITCH_OFF_BACKGROUND_COLOR');
  static Color switchOffColor = parseEnvValue('SWITCH_OFF_COLOR');
  static Color switchOnColor = parseEnvValue('SWITCH_ON_COLOR');
  static Color switchOffLineColor = parseEnvValue('SWITCH_OFF_LINE_COLOR');
  static Color switchOnLineColor = parseEnvValue('SWITCH_ON_LINE_COLOR');

  static const Color dark_333333 = Color(0xff333333);
  static const Color grey_main_575757 = Color(0xff575757);
  static const Color grey_50_ababab = Color(0xffababab);
  static const Color grey_50_9a9a9a = Color(0xff9A9A9A);
  static const Color lightgrey_f3f3f2 = Color(0xfff3f3f2);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);

  static const Color obsolete = Color(0xfff5f5f5);
  static const Color obsolete_aaaaaa_obsolete = Color(0xffaaaaaa);

  static const Color violet_ab517c = Color(0xffab517c);
  static const Color Colororange_ef7844 = Color(0xffef7844);
  static const Color light_blue_5995ed = Color(0xff5995ed);
  static const Color messageDetailsColor = Color(0xffd8d8d8);
  static const Color blue_172183 = Color(0xff172183);
  static const Color purple_801977 = Color(0xff801977);
  static const Color dark_green = Color(0xff006431);

  static const Color grey_50_b3b3b3 = Color(0xffb3b3b3);
  static const Color grey_e8e8e8 = Color(0xffe8e8e8);

  // ignore: constant_identifier_names
  static const Color grey_main = Color(0xff6d6d6d);

  static const int opacity20 = 0x33;
  static const int opacity90 = 0xE6;

  /// color const
  static const Color benzin95 = Color(0xff469500);

  /// color const
  static const Color benzin98 = Color(0xff1e6200);

  /// color const
  static const Color vPower = Color(0xffbca500);

  // Services
  static const Color zurichBlue = Color(0xff2167ae);
  static const Color simpegoRed = Color(0xffff7c7c);
  static const Color amagGrey = Color(0xff6f6d6a);
  static const Color orangeF3A51B = Color(0xffF3A51B);

  static const Color blue1FB1E6 = Color(0xff1FB1E6);
  static const Color red_ff7569 = Color(0xffFF7569);

  static Color parseEnvValue(String variable) {
    return Color(DotenvUtils.getInt(variable));
  }
}

class HexColor extends Color {
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    String color = hexColor.toUpperCase().replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$hexColor';
    }
    return int.parse(color, radix: 16);
  }
}
