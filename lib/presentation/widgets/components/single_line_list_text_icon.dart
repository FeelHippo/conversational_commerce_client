import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class SingleLineListTextIcon extends StatelessWidget {
  const SingleLineListTextIcon({
    super.key,
    this.leading,
    this.trailing,
    this.text,
    this.label,
    this.onTap,
    this.overrideLeftPadding,
    this.overrideRightPadding,
    this.enabled = true,
    this.leadingAndTextPadding = 23,
    this.minHeight,
    this.bgColor,
    this.textStyle,
  });

  final Widget? leading;
  final Widget? trailing;
  final Widget? text;
  final Widget? label;
  final VoidCallback? onTap;
  final double? overrideLeftPadding;
  final double? overrideRightPadding;
  final bool enabled;
  final double leadingAndTextPadding;
  final double? minHeight;
  final Color? bgColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor ?? (enabled ? Palette.appCardColor : Palette.grey10),
      borderRadius:
          BorderRadius.circular(double.parse(dotenv.get('CARD_BORDER_RADIUS'))),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          double.parse(dotenv.get('CARD_BORDER_RADIUS')),
        ),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minHeight: minHeight ?? 75),
          padding: EdgeInsets.only(
            left: overrideLeftPadding ?? 18,
            right: overrideRightPadding ?? 18,
          ),
          child: Row(
            children: <Widget>[
              if (leading != null) _buildLeadingWidget(),
              _buildTextWidget(),
              if (trailing != null) _buildTrailingWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrailingWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 23),
      child: trailing,
    );
  }

  Widget _buildTextWidget() {
    Widget child;
    if (text != null) {
      child = Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacings.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (label != null) label!,
            if (label != null) const SizedBox(height: Spacings.small),
            DefaultTextStyle.merge(
              style: textStyle ??
                  (enabled
                      ? TextStyles.header4Bold()
                      : TextStyles.header4Bold()
                          .copyWith(color: Palette.grey50)),
              child: text!,
            ),
          ],
        ),
      );
    } else {
      child = const SizedBox.expand();
    }
    return Expanded(child: child);
  }

  Widget _buildLeadingWidget() {
    return Padding(
      padding: EdgeInsets.only(right: leadingAndTextPadding),
      child: leading,
    );
  }
}
