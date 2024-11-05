import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/text_styles.dart';

class AppBarTextHeader extends StatelessWidget {
  const AppBarTextHeader({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.textColor,
    this.isTextBold = false,
  });

  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final bool isTextBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.header3(
        color: textColor ?? Palette.primary,
        fontWeight: isTextBold ? FontWeight.w700 : FontWeight.w400,
      ),
      textAlign: textAlign,
    );
  }
}
