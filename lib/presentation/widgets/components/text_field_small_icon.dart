import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadtplan/presentation/widgets/app_card.dart';
import 'package:stadtplan/presentation/widgets/components/text_message_small.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/text_styles.dart';
import 'package:stadtplan/themes/constants/spacings.dart';

class TextFieldSmallIcon extends StatefulWidget {
  const TextFieldSmallIcon({
    super.key,
    required this.text,
    this.hint,
    this.editable = true,
    this.enabled = true,
    this.autoFocus = false,
    this.maxLength,
    this.selection = 0,
    this.suffixIcon,
    this.onTextChanged,
    this.onSubmitted,
    this.textInputAction,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.error,
    this.info,
    this.prefixIcon,
    required this.controller,
  });

  static const Key textFieldSmallIcon =
      ValueKey<String>('text-field-small-icon');

  final String? text;
  final String? hint;
  final bool editable;
  final bool enabled;
  final bool autoFocus;
  final int? maxLength;
  final int selection;
  final Widget? suffixIcon;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;
  final String? info;
  final Widget? prefixIcon;
  final TextEditingController controller;

  @override
  TextFieldSmallIconState createState() => TextFieldSmallIconState();
}

class TextFieldSmallIconState extends State<TextFieldSmallIcon> {
  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      widget.controller.text = widget.text!;
    }
    int offset;
    if (widget.autoFocus && widget.text != null) {
      offset = widget.text!.length;
    } else {
      offset = widget.selection;
    }
    widget.controller.selection =
        TextSelection.fromPosition(TextPosition(offset: offset));
  }

  @override
  void didUpdateWidget(TextFieldSmallIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      widget.controller.text = widget.text!;
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Focus(
            focusNode: widget.focusNode,
            child: TextField(
              key: TextFieldSmallIcon.textFieldSmallIcon,
              controller: widget.controller,
              enabled: widget.enabled && widget.editable,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              maxLength: widget.maxLength,
              style: widget.enabled
                  ? TextStyles.paragraphRegular(color: Palette.greyDark)
                  : TextStyles.paragraphRegular(),
              textInputAction: widget.textInputAction,
              buildCounter: (
                BuildContext context, {
                int? currentLength,
                int? maxLength,
                bool? isFocused,
              }) =>
                  null,
              autofocus: widget.autoFocus,
              decoration: InputDecoration(
                border: const _NoUnderlineInputBorder(),
                contentPadding: const EdgeInsets.only(
                  top: 12,
                  left: Spacings.medium,
                  right: Spacings.medium,
                  bottom: Spacings.medium,
                ),
                fillColor:
                    widget.enabled ? Palette.appCardColor : Palette.grey10,
                filled: true,
                hintText: widget.hint,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                hintStyle: TextStyles.paragraphRegular(color: Palette.grey50),
              ),
              onSubmitted: (String value) => widget.onSubmitted?.call(value),
              onChanged: (String value) => widget.onTextChanged?.call(value),
            ),
          ),
          if (widget.error != null)
            TextMessageSmall(
              text: widget.error ?? '',
              textColor: Palette.error,
            ),
          if (widget.info != null) TextMessageSmall(text: widget.info ?? ''),
        ],
      ),
    );
  }
}

class _NoUnderlineInputBorder extends UnderlineInputBorder {
  const _NoUnderlineInputBorder()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide.none,
        );
}
