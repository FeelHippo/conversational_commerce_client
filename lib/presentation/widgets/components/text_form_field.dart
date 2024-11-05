import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextFormEditField extends StatefulWidget {
  const TextFormEditField({
    super.key,
    this.context,
    this.label,
    this.hint,
    this.textInputType,
    this.text,
    this.enabled = true,
    this.fillColor,
    this.maxLength = 500,
    required this.controller,
    this.currentFocusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
    this.isObscureText = false,
    this.textInputFormatter,
    this.funOnChanged,
    this.showRightSideCheck = false,
    this.showRightSideCheckColor,
    this.textCapitalization,
    this.padding = const EdgeInsets.only(
      top: Spacings.medium,
      right: Spacings.medium,
      left: Spacings.medium,
    ),
    this.errorText,
    this.autofillHints,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.autocorrect = false,
    this.isError = false,
    this.validator,
    this.autoValidateMode,
  });

  final BuildContext? context;
  final String? label;
  final String? hint;
  final String? text;
  final bool enabled;
  final Color? fillColor;
  final bool isObscureText;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final int maxLength;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final String? errorText;
  final EdgeInsets padding;
  final List<TextInputFormatter>? textInputFormatter;
  final Function? funOnChanged;
  final TextCapitalization? textCapitalization;
  final bool showRightSideCheck;
  final Color? showRightSideCheckColor;
  final Iterable<String>? autofillHints;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool autocorrect;
  final bool isError;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;

  @override
  _TextFormEditFieldState createState() => _TextFormEditFieldState();
}

class _TextFormEditFieldState extends State<TextFormEditField> {
  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      widget.controller.text = widget.text!;
    }
  }

  @override
  void didUpdateWidget(TextFormEditField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      if (widget.text != null) {
        widget.controller.text = widget.text!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction,
      cursorColor: Palette.primary,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      obscureText: widget.isObscureText,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      enabled: widget.enabled,
      focusNode: widget.currentFocusNode,
      autocorrect: widget.autocorrect,
      autovalidateMode: widget.autoValidateMode,
      onFieldSubmitted: (String value) {
        if (widget.currentFocusNode != null) {
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          } else {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        } else {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      validator: widget.validator,
      style: TextStyles.header4Regular(),
      decoration: _inputDecoration(),
      onChanged: (String value) {
        if (widget.funOnChanged != null) {
          widget.funOnChanged!.call(value);
        }
      },
      autofillHints: widget.autofillHints,
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      fillColor: widget.fillColor,
      labelText: widget.label,
      hintText: widget.hint,
      suffixIcon: getSuffixIcon(),
      errorBorder: _underlineInputBorder(),
      focusedErrorBorder: _underlineInputBorder(),
      prefix: widget.prefix,
      prefixIcon: widget.prefixIcon,
    );
  }

  UnderlineInputBorder? _underlineInputBorder() {
    return widget.controller.text.isEmpty
        ? UnderlineInputBorder(
            borderSide: BorderSide(
              color: Palette.error,
              width: 3,
            ),
          )
        : null;
  }

  Widget? getSuffixIcon() {
    if (widget.showRightSideCheck) {
      return ImageAssets.iconCheckSmall(
        color: widget.showRightSideCheckColor ?? Palette.success,
      );
    } else if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    } else {
      return null;
    }
  }
}
