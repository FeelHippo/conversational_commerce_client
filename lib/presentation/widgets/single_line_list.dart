import 'package:stadtplan/presentation/widgets/app_card.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/textlabels/text_h4.dart';

class SingleLineList extends StatelessWidget {
  const SingleLineList({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
    this.textKey,
    this.verticalPadding = 0.0,
  });

  final String title;

  final Image image;

  final Function? onTap;

  final Key? textKey;

  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: AppCardWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacings.large,
            vertical: verticalPadding != 0.0 ? verticalPadding : Spacings.large,
          ),
          child: Row(
            children: <Widget>[
              image,
              const SizedBox(width: Spacings.medium),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: Spacings.medium),
                  child: TextH4(
                    key: textKey,
                    text: title,
                    isTextBold: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
