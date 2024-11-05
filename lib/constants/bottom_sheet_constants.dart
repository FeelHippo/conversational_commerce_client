import 'package:flutter/material.dart';
import 'package:stadtplan/constants/integer_constants.dart';

// ignore: avoid_classes_with_only_static_members
class BottomSheetConstants {
  static const String heightLarge = 'height_large';
  static const String heightMedium = 'height_medium';
  static const String heightSmall = 'height_small';
  static const String heightFull = 'height_full';

  static double getHeight(String heightTag, BuildContext context) {
    if (heightTag == heightFull) {
      return MediaQuery.of(context).size.height;
    } else if (heightTag == heightLarge) {
      return MediaQuery.of(context).size.height *
          IntegerConstants.bottomSheetHeightForLarge;
    } else if (heightTag == heightMedium) {
      return MediaQuery.of(context).size.height *
          IntegerConstants.bottomSheetHeightForHalf;
    } else if (heightTag == heightSmall) {
      return MediaQuery.of(context).size.height *
          IntegerConstants.bottomSheetHeightForLow;
    } else {
      return MediaQuery.of(context).size.height;
    }
  }
}
