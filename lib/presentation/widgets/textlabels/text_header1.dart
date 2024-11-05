import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextHeader1 extends StatelessWidget {
  const TextHeader1({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.color,
    this.minHeight,
    this.isTextBold = false,
  });

  final String text;
  final Color? color;
  final double? minHeight;
  final TextAlign? textAlign;
  final bool isTextBold;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyles.header1(
      color: color ?? Palette.greyDark,
      fontWeight: isTextBold ? FontWeight.w700 : FontWeight.w400,
    );
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
