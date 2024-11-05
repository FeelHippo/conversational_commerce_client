import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/components/button_round.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';

class MapFilterWidget extends StatelessWidget {
  const MapFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Spacings.large),
      child: ButtonRound(
        elevation: 3,
        onPressed: () {},
        child: SizedBox(
          width: 40,
          height: 40,
          child: ImageAssets.icFilter(color: Palette.primary),
        ),
      ),
    );
  }
}
