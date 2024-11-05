import 'package:flutter/material.dart';
import 'package:stadtplan/themes/text_styles.dart';
import 'package:stadtplan/utils/dotenv_utils.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.text,
    this.onTap,
    this.trailing,
    this.bgColor,
    this.textColor,
    this.enabled = true,
  });

  static double defaultHeight = DotenvUtils.getDouble('BUTTON_DEFAULT_HEIGHT');

  final String text;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool enabled;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: defaultHeight,
      onPressed: enabled
          ? () {
              if (onTap != null) {
                onTap!.call();
              }
            }
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          DotenvUtils.getDouble('CARD_BORDER_RADIUS'),
        ),
      ),
      minWidth: MediaQuery.of(context).size.width,
      color: bgColor ?? Palette.buttonBgColor,
      disabledElevation: 0.5,
      disabledColor: Palette.messageDetailsColor,
      elevation: 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildTextWidget(),
          if (trailing != null) _buildTrailingWidget(),
        ],
      ),
    );
  }

  Widget _buildTextWidget() {
    return Flexible(
      child: Text(
        text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.buttonPrimary(
          textColor: textColor ?? Palette.buttonTextColor,
        ),
      ),
    );
  }

  Widget _buildTrailingWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        right: Spacings.small,
        left: Spacings.medium,
      ),
      child: trailing,
    );
  }
}
