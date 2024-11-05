import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/circular_progress_bar.dart';
import 'package:stadtplan/presentation/widgets/textlabels/text_h4.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';

class RadioListTileWidget<T> extends StatelessWidget {
  const RadioListTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.colorSelected,
    this.colorUnSelected,
    this.isLoading = false,
  });

  /// Label
  final String title;

  /// Value = Own value
  final T value;

  /// Group Value = Selected value
  final T groupValue;

  /// onChanged
  final ValueChanged<T> onChanged;

  /// colorSelected
  final Color? colorSelected;

  /// colorUnSelected
  final Color? colorUnSelected;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (value == groupValue)
                ImageAssets.radiobuttonOn(
                  color: colorSelected ?? Palette.primary,
                )
              else
                ImageAssets.radiobuttonOff(color: colorUnSelected),
              const SizedBox(width: 8),
              TextH4(text: title),
            ],
          ),
          if (isLoading)
            Padding(
              padding: const EdgeInsets.only(left: Spacings.medium),
              child: SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressBar(
                  color: colorSelected,
                  strokeWidth: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
