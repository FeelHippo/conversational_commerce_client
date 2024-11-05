import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/text_styles.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    super.key,
    required this.text,
    this.onTap,
    this.enabled = true,
    this.minHeight = 50,
    this.isCenter = true,
    this.isBold = false,
    this.textColor,
  });
  final String text;
  final VoidCallback? onTap;
  final double minHeight;
  final bool isCenter;
  final bool isBold;
  final Color? textColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: enabled ? onTap : null,
        child: Container(
          alignment: isCenter ? Alignment.center : Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: minHeight, minWidth: 88),
          padding: EdgeInsets.only(left: isCenter ? 18 : 0, right: 18),
          child: Text(
            text,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: TextStyles.buttonSecondary(
              textColor: textColor ?? Palette.buttonSecondaryTextColor,
              isTextBold: isBold,
            ),
          ),
        ),
      ),
    );
  }
}
