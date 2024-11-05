import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar(
      {super.key, this.widgetKey, this.color, this.strokeWidth = 3});

  final Key? widgetKey;

  final Color? color;

  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      key: widgetKey,
      valueColor: AlwaysStoppedAnimation<Color>(color ?? Palette.primary),
      strokeWidth: strokeWidth,
    );
  }
}
