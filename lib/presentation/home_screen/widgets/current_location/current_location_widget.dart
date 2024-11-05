import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/components/button_round.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Spacings.medium),
      child: ButtonRound(
        elevation: 3,
        onPressed: onPressed,
        child: SizedBox(
          width: 40,
          height: 40,
          child: ImageAssets.icCurrentLocation(
            color: Palette.primary,
          ),
        ),
      ),
    );
  }
}
