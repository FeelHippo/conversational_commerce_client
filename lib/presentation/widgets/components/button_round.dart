import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';

class ButtonRound extends StatelessWidget {
  const ButtonRound({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.elevation = 0,
    this.height,
    this.minWidth,
    required this.child,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double elevation;
  final double? height;
  final double? minWidth;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height ?? 48,
      minWidth: minWidth ?? 48,
      padding: EdgeInsets.zero,
      child: MaterialButton(
        elevation: elevation,
        disabledElevation: elevation,
        shape: const CircleBorder(),
        onPressed: enabled ? onPressed : null,
        color: backgroundColor ?? Palette.appCardColor,
        disabledColor: Palette.grey10,
        child: child,
      ),
    );
  }
}
