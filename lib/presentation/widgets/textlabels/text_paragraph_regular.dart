import 'package:flutter/material.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextParagraphRegular extends StatelessWidget {
  const TextParagraphRegular({
    super.key,
    required this.text,
    this.color,
    this.isTextBold = false,
    this.textAlign,
    this.textDecoration = TextDecoration.none,
  });

  final String text;
  final Color? color;
  final bool isTextBold;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (isTextBold) {
      style = TextStyles.paragraphBold(
        color: color,
        textDecoration: textDecoration,
      );
    } else {
      style = TextStyles.paragraphRegular(
        color: color,
        textDecoration: textDecoration,
      );
    }

    return Text(
      text,
      style: style,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
