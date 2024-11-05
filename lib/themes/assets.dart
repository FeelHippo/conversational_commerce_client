import 'package:flutter/material.dart';

class ImageAssets {
  static String imageEndPoint = 'assets/common/';

  static Image icNavMap({Color? color}) =>
      Image.asset('${imageEndPoint}ic_nav_map.png', color: color);

  static Image icNavCharge({Color? color}) =>
      Image.asset('${imageEndPoint}ic_nav_charge.png', color: color);

  static Image icNavChargeSelected({Color? color}) =>
      Image.asset('${imageEndPoint}ic_nav_charge_selected.png', color: color);

  static Image icNavSettings({Color? color}) =>
      Image.asset('${imageEndPoint}ic_nav_settings.png', color: color);

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

  static Image icLeftArrow({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_left_arrow.png',
        color: color,
        key: key,
      );

  static Image icRightArrow({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_right_arrow.png',
        color: color,
        key: key,
      );

  static Image icAppInfo({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_app_info.png',
        color: color,
        key: key,
      );

  static Image icLeaveApp({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_leave_app.png',
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

  static Image icAdd({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_add.png',
        color: color,
        key: key,
      );

  static Image icMore({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_more.png',
        color: color,
        key: key,
      );

  static Image icStar({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_star.png',
        color: color,
        key: key,
      );

  static Image icFleetChargeCard({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_fleet_charge.png',
        color: color,
        key: key,
      );

  static Image icCheckSmall({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_check_small.png',
        color: color,
        key: key,
      );

  static Image icHome({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}ic_home.png',
        color: color,
        key: key,
      );

  static Image radiobuttonOn({Color? color}) =>
      Image.asset('${imageEndPoint}radiobutton_on.png', color: color);

  static Image radiobuttonOff({Color? color}) =>
      Image.asset('${imageEndPoint}radiobutton_off.png', color: color);

  static Image mapBackground({Key? key}) => Image.asset(
        '${imageEndPoint}map_background.png',
        key: key,
      );

  static Image money({
    Key? key,
    double? width,
    double? height,
    Color? color,
  }) =>
      Image.asset(
        '${imageEndPoint}money.png',
        key: key,
        width: width,
        height: height,
        color: color,
      );

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

  static Image mapNavigation({Color? color}) => Image.asset(
        '${imageEndPoint}map_navigation.png',
        color: color,
      );

  static Image arrowRightSmall({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}arrow_right_small.png',
        color: color,
        key: key,
        width: 30,
        height: 30,
      );

  static Image cameraViewfinder({Key? key, BoxFit? fit}) => Image.asset(
        '${imageEndPoint}camera_viewfinder.png',
        key: key,
        fit: fit,
      );

  static Image iconCheckSmall({Key? key, Color? color}) => Image.asset(
        '${imageEndPoint}icon_check_small.png',
        key: key,
        color: color,
      );

  static Image iconMore({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}icon_more.png',
        color: color,
        key: key,
      );

  static Image add({Color? color, Key? key}) => Image.asset(
        '${imageEndPoint}add.png',
        color: color,
        key: key,
      );

  static Image icMarkerSmall({Key? key, Color? color}) => Image.asset(
    '${imageEndPoint}ic_marker_small.png',
    color: color,
    key: key,
  );
}
