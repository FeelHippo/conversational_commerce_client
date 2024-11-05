import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/widgets/app_card.dart';
import 'package:stadtplan/presentation/widgets/components/text_field_small_icon.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/utils/dotenv_utils.dart';

class PlacesAutoCompleteTextField extends StatefulWidget {
  const PlacesAutoCompleteTextField({
    super.key,
    required this.value,
    this.onChanged,
    this.onSubmitted,
    this.onClearClicked,
    this.hint,
    required this.isFromMapScreen,
  });

  final String value;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final VoidCallback? onClearClicked;
  final String? hint;
  final bool isFromMapScreen;

  @override
  State<PlacesAutoCompleteTextField> createState() =>
      _PlacesAutoCompleteTextFieldState();
}

class _PlacesAutoCompleteTextFieldState
    extends State<PlacesAutoCompleteTextField> {
  final TextEditingController textEditingControllerSearch =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      cornerRadius: DotenvUtils.getDouble('CARD_BORDER_RADIUS'),
      child: TextFieldSmallIcon(
        controller: textEditingControllerSearch,
        text: widget.value,
        onTextChanged: widget.onChanged,
        prefixIcon: widget.isFromMapScreen
            ? IconButton(
          iconSize: Spacings.custom20,
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            AppNavigator.doPopUp(context);
          },
        )
            : null,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          iconSize: Spacings.custom20,
          onPressed: () {
            textEditingControllerSearch.clear();
            if (widget.onClearClicked != null) {
              widget.onClearClicked!.call();
            }
          },
        ),
        autoFocus: true,
        onSubmitted: (String value) {
          if (value.isEmpty) {
            widget.onSubmitted?.call();
          }
        },
      ),
    );
  }
}
