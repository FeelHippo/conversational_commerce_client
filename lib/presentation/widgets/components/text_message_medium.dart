import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextMessageMedium extends StatelessWidget {
  const TextMessageMedium({super.key, required this.text, this.textColor});

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      constraints: const BoxConstraints(minHeight: 33),
      padding: const EdgeInsets.symmetric(
        vertical: Spacings.small,
        horizontal: Spacings.large,
      ),
      child: Text(
        text,
        style: textColor != null
            ? TextStyles.lauftextNormalBlack.copyWith(color: textColor)
            : TextStyles.lauftextNormalBlack,
      ),
    );
  }
}
