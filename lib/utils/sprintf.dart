import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/text_styles.dart';

const String placeholderPattern = '(\{\{([a-zA-Z0-9]+)\}\})';
final RegExp _regExp = RegExp(placeholderPattern);

String sprintf(String template, List<dynamic> replacements) {
  assert(
    _regExp.allMatches(template).length == replacements.length,
    'Template and Replacements length are incompatible',
  );

  String result = template;
  for (final dynamic replacement in replacements) {
    result = result.replaceFirst(_regExp, replacement.toString());
  }

  return result;
}

TextSpan spannableText(String text, String spanText, Function onTap) {
  final TextStyle textStyles = TextStyles.paragraphRegular();

  if (spanText == '') {
    return TextSpan(text: text, style: textStyles);
  }
  final String refinedText = text.toLowerCase();
  final String refinedSpan = spanText.toLowerCase();
  if (refinedText.contains(refinedSpan)) {
    if (refinedText.substring(0, refinedSpan.length) == refinedSpan) {
      return TextSpan(
        style: textStyles.copyWith(color: Palette.primary),
        text: text.substring(0, refinedSpan.length),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            onTap();
          },
        children: <InlineSpan>[
          spannableText(
            text.substring(
              refinedSpan.length,
            ),
            spanText,
            onTap,
          ),
        ],
      );
    } else if (refinedText.length == refinedSpan.length) {
      return TextSpan(
        text: text,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            onTap();
          },
        style: textStyles.copyWith(color: Palette.primary),
      );
    } else {
      return TextSpan(
        style: textStyles,
        text: text.substring(
          0,
          refinedText.indexOf(refinedSpan),
        ),
        children: <InlineSpan>[
          spannableText(
            text.substring(
              refinedText.indexOf(refinedSpan),
            ),
            spanText,
            onTap,
          ),
        ],
      );
    }
  } else if (!refinedText.contains(refinedSpan)) {
    return TextSpan(
      text: text,
      style: TextStyles.paragraphRegular(
        color: Palette.greyDark,
      ),
    );
  }
  return TextSpan(
    text: text.substring(0, refinedText.indexOf(refinedSpan)),
    style: TextStyles.paragraphRegular(
      color: Palette.greyDark,
    ),
    children: <InlineSpan>[
      spannableText(
        text.substring(refinedText.indexOf(refinedSpan)),
        spanText,
        onTap,
      ),
    ],
  );
}
