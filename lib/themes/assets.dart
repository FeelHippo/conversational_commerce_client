import 'package:flutter/material.dart';

class ImageAssets {
  static String imageEndPoint = 'assets/common/';

  static Image icLogoZuerich({Color? color}) =>
      Image.asset('${imageEndPoint}logo_zuerich.png', color: color);
}
