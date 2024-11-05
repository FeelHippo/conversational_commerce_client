import 'package:flutter/material.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextHeader2 extends StatelessWidget {
  const TextHeader2({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.color,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyles.header2(color: color);
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
