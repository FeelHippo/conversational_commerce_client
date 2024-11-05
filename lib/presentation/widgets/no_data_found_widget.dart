import 'package:stadtplan/presentation/widgets/textlabels/text_h4.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  static Key noDataFoundWidgetTitleLabelKey =
      const Key('NoDataFoundWidget-Title-label');

  static Key noDataFoundWidgetLogoImageKey =
      const Key('NoDataFoundWidget-Logo-image');

  final String title;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacings.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            key: noDataFoundWidgetLogoImageKey,
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.white,
            ),
            child: icon,
          ),
          SizedBox(
            height: title == '' ? 0 : Spacings.medium,
          ),
          TextH4(
            text: title,
            textAlign: TextAlign.center,
            key: noDataFoundWidgetTitleLabelKey,
            isTextBold: true,
          ),
        ],
      ),
    );
  }
}
