import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    super.key,
    this.padding,
    required this.child,
    this.backgroundColor,
    this.showShadow = true,
    this.minHeight = 0,
    this.cornerRadius,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool showShadow;
  final double minHeight;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow> shadow = <BoxShadow>[];
    if (showShadow) {
      shadow.add(
        BoxShadow(
          color: Palette.greyDark.withAlpha(0x0c),
          blurRadius: 9,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        decoration: BoxDecoration(
          color: backgroundColor ?? Palette.appCardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: shadow,
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
