import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadtplan/presentation/widgets/app_card.dart';
import 'package:stadtplan/presentation/widgets/components/text_message_small.dart';
import 'package:stadtplan/presentation/widgets/textlabels/text_small.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class TextFieldWithCount extends StatefulWidget {
  const TextFieldWithCount({
    super.key,
    this.label,
    this.text,
    this.hint,
    this.enabled = true,
    this.multiline = false,
    this.maxLength,
    this.selection = 0,
    this.suffixIcon,
    this.error,
    this.info,
    this.focusNode,
    this.textInputAction,
    this.onTextChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputFormatter,
  });

  final String? label;
  final String? text;
  final String? hint;
  final bool enabled;
  final bool multiline;
  final int? maxLength;
  final int selection;
  final Widget? suffixIcon;
  final String? error;
  final String? info;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  TextFieldWithCountState createState() => TextFieldWithCountState();
}

class TextFieldWithCountState extends State<TextFieldWithCount> {
  static const ValueKey<String> textFieldKey =
      ValueKey<String>('TextFieldWithCountState.textFieldKey');

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.text ?? '';
    int offset;
    if (widget.autofocus && widget.text != null) {
      offset = widget.text!.length;
    } else {
      offset = widget.selection;
    }
    _controller.selection =
        TextSelection.fromPosition(TextPosition(offset: offset));
  }

  @override
  void didUpdateWidget(TextFieldWithCount oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _controller.text = widget.text ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppCardWidget(
          child: Stack(
            children: <Widget>[
              TextField(
                controller: _controller,
                inputFormatters: widget.textInputFormatter,
                enabled: widget.enabled,
                autofocus: widget.autofocus,
                onSubmitted: (String value) => widget.onSubmitted?.call(value),
                onChanged: (String value) {
                  setState(() {
                    widget.onTextChanged?.call(value);
                  });
                },
                maxLines: widget.multiline ? null : 1,
                style: TextStyles.header4Regular(color: Palette.greyDark),
                textInputAction: widget.textInputAction,
                keyboardType: widget.keyboardType,
                buildCounter: (
                  BuildContext context, {
                  required int currentLength,
                  required int? maxLength,
                  required bool isFocused,
                }) =>
                    null,
                decoration: InputDecoration(
                  border: const _NoUnderlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Spacings.medium,
                    vertical: Spacings.medium,
                  ),
                  fillColor:
                      widget.enabled ? Palette.appCardColor : Palette.grey10,
                  filled: true,
                  labelText: widget.label,
                  labelStyle: TextStyles.smallRegular(),
                  suffixIcon: widget.suffixIcon,
                ),
              ),
              if (widget.maxLength != null) _buildCounter(),
            ],
          ),
        ),
        if (widget.error != null)
          TextMessageSmall(text: widget.error!, textColor: Palette.error),
      ],
    );
  }

  Widget _buildCounter() {
    return Positioned(
      top: Spacings.medium,
      right: Spacings.medium,
      child: TextSmall(
        text: '${_controller.text.length}/${widget.maxLength}',
        color: Palette.grey50,
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
