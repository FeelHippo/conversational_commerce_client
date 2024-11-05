import 'package:flutter/material.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextHeader4 extends StatelessWidget {
  const TextHeader4({
    super.key,
    required this.text,
    this.color,
    this.minHeight = 104,
    this.isTextBold = false,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final Color? color;
  final double minHeight;
  final bool isTextBold;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (isTextBold) {
      style = TextStyles.header4Bold(color: color);
    } else {
      style = TextStyles.header4Regular(color: color);
    }

    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
