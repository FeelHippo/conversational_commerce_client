import 'package:flutter/material.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextTiny extends StatelessWidget {
  const TextTiny({
    super.key,
    required this.text,
    this.color,
    this.textSize = 10,
    this.isTextBold = false,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final Color? color;
  final bool isTextBold;
  final double? textSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (isTextBold) {
      style = TextStyles.tinyBold(color: color, textSize: textSize);
    } else {
      style = TextStyles.tinyRegular(color: color, textSize: textSize);
    }

    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
