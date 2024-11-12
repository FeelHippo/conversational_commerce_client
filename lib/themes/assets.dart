import 'package:flutter/material.dart';

class ImageAssets {
  static String imageEndPoint = 'assets/common/';

  static Image icLogoZuerich({Color? color}) =>
      Image.asset('${imageEndPoint}logo_zuerich.png', color: color);

  static Image icNavMap({Color? color}) =>
      Image.asset('${imageEndPoint}ic_nav_map.png', color: color);

  static Image icCurrentLocation({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_current_location.png',
        color: color,
        key: key,
      );

  static Image icFilter({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_filter.png',
        color: color,
        key: key,
      );

  static Image icDelete({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_delete.png',
        color: color,
        key: key,
      );

  static Image icNavigationBack({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_navigation_back.png',
        color: color,
        key: key,
      );

  static Image icStar({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_star.png',
        color: color,
        key: key,
      );

  static Image radiobuttonOn({Color? color}) =>
      Image.asset('${imageEndPoint}radiobutton_on.png', color: color);

  static Image radiobuttonOff({Color? color}) =>
      Image.asset('${imageEndPoint}radiobutton_off.png', color: color);

  static Image arrowRight({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}arrow_right.png',
        key: key,
        color: color,
        width: 30,
        height: 30,
      );

  static Image icSearch({Key? key, Color? color, double? scale}) => Image.asset(
        'assets/common/ic_search.png',
        color: color,
        key: key,
        scale: scale,
      );

  static Image icMarkerSmall({Key? key, Color? color}) => Image.asset(
        '${imageEndPoint}ic_marker_small.png',
        color: color,
        key: key,
      );

  static Image iconCheckSmall({Key? key, Color? color}) => Image.asset(
        '${imageEndPoint}icon_check_small.png',
        key: key,
        color: color,
      );
}
