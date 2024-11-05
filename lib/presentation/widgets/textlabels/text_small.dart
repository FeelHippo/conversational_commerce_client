import 'package:flutter/material.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextSmall extends StatelessWidget {
  const TextSmall({
    super.key,
    required this.text,
    this.color,
    this.isTextBold = false,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final Color? color;
  final bool isTextBold;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (isTextBold) {
      style = TextStyles.smallBold(
        color: color,
      );
    } else {
      style = TextStyles.smallRegular(color: color);
    }

    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
