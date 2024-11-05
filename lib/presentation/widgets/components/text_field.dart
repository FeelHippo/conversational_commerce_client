import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadtplan/presentation/widgets/app_card.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextEditField extends StatefulWidget {
  const TextEditField({
    super.key,
    this.context,
    this.label,
    this.hint,
    this.textInputType,
    this.text,
    this.enabled = true,
    this.fillColor,
    this.disabledColor,
    this.maxLength = 500,
    required this.controller,
    this.currentFocusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
    this.isObscureText = false,
    this.textInputFormatter,
    this.funOnChanged,
    this.showRightSideCheck = false,
    this.textCapitalization,
    this.multiline = false,
    this.padding = const EdgeInsets.only(
      top: Spacings.medium,
      right: Spacings.medium,
      left: Spacings.medium,
    ),
    this.onSubmitted,
    this.errorText,
    this.autofillHints,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.autocorrect = false,
    this.autoFocus = false,
  });

  /// context
  final BuildContext?
      context; // TODOcontext shouldn't be passed as constructor parameter

  /// label
  final String? label;

  /// label
  final String? hint;

  /// text
  final String? text;

  /// enabled
  final bool enabled;

  /// fillColor
  final Color? fillColor;

  /// disabledColor
  final Color? disabledColor;

  /// isObscureText
  final bool isObscureText;

  /// textInputType
  final TextInputType? textInputType;

  /// controller
  final TextEditingController controller;

  /// textInputAction
  final TextInputAction textInputAction;

  /// maxLength
  final int maxLength;

  /// currentFocusNode
  final FocusNode? currentFocusNode;

  /// nextFocusNode
  final FocusNode? nextFocusNode;

  final String? errorText;

  final EdgeInsets padding;

  final List<TextInputFormatter>? textInputFormatter;

  final Function? funOnChanged;

  final TextCapitalization? textCapitalization;

  final bool showRightSideCheck;

  final Iterable<String>? autofillHints;

  final Widget? prefixIcon;

  final Widget? prefix;

  final Widget? suffixIcon;

  final bool autocorrect;
  final ValueChanged<String>? onSubmitted;

  final bool multiline;

  final bool autoFocus;

  @override
  TextEditFieldState createState() => TextEditFieldState();
}

class TextEditFieldState extends State<TextEditField> {
  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      widget.controller.text = widget.text!;
    }
  }

  @override
  void didUpdateWidget(TextEditField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      if (widget.text != null) {
        widget.controller.text = widget.text!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: AppCardWidget(
        child: TextField(
          inputFormatters: widget.textInputFormatter,
          textInputAction: widget.textInputAction,
          cursorColor: Palette.primary,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          obscureText: widget.isObscureText,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          enabled: widget.enabled,
          maxLines: widget.multiline ? null : 1,
          focusNode: widget.currentFocusNode,
          autocorrect: widget.autocorrect,
          autofocus: widget.autoFocus,
          onSubmitted: (String value) {
            if (widget.currentFocusNode != null) {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              } else {
                FocusScope.of(context).requestFocus(FocusNode());
              }
            } else {
              FocusScope.of(context).requestFocus(FocusNode());
            }

            widget.onSubmitted?.call(value);
          },
          style: TextStyles.textFieldLabel(),
          decoration: _inputDecoration(),
          onChanged: (String value) {
            if (widget.funOnChanged != null) {
              widget.funOnChanged!(value);
            }
          },
          autofillHints: widget.autofillHints,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      fillColor: widget.enabled
          ? widget.fillColor
          : widget.disabledColor ?? Palette.appCardColor,
      labelText: widget.label,
      hintText: widget.hint,
      suffixIcon: getSuffixIcon(),
      prefix: widget.prefix,
      prefixIcon: widget.prefixIcon,
      errorText: widget.errorText,
    );
  }

  Widget? getSuffixIcon() {
    if (widget.showRightSideCheck) {
      return ImageAssets.icDelete(color: Palette.success);
    } else if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    } else {
      return null;
    }
  }
}
