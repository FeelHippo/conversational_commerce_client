import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextMessageSmall extends StatelessWidget {
  const TextMessageSmall({super.key, required this.text, this.textColor});

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      constraints: const BoxConstraints(minHeight: 33),
      padding: const EdgeInsets.only(
        top: Spacings.medium,
        left: Spacings.small,
        right: Spacings.small,
      ),
      child: Text(
        text,
        style: textColor != null
            ? TextStyles.smallRegular(color: textColor)
            : TextStyles.smallRegular(color: Palette.grey50),
      ),
    );
  }
}
