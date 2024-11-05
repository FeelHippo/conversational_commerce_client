import 'package:stadtplan/presentation/widgets/textlabels/text_h4.dart';
import 'package:stadtplan/presentation/widgets/textlabels/text_header2.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:flutter/material.dart';

class BottomSheetHeaderWidget extends StatelessWidget {
  const BottomSheetHeaderWidget({
    super.key,
    this.title,
    this.subTitle,
    this.keySubTitle,
    this.keyTitle,
    this.keyCloseButton,
    this.padding = EdgeInsets.zero,
    this.bottomPadding = true,
    this.titlePadding = Spacings.large,
    this.onCloseCallBack,
    this.isCloseButtonVisible = true,
  });

  final String? title;
  final String? subTitle;
  final Key? keyTitle;
  final Key? keySubTitle;
  final Key? keyCloseButton;
  final EdgeInsets padding;
  final double titlePadding;
  final bool? bottomPadding;
  final bool isCloseButtonVisible;
  final VoidCallback? onCloseCallBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: padding,
          child: isCloseButtonVisible
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    key: keyCloseButton,
                    onTap: () {
                      if (onCloseCallBack != null) {
                        onCloseCallBack?.call();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.appCardColor,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Palette.greyMain,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
        SizedBox(
          height: titlePadding,
        ),
        if (title != null && title!.isNotEmpty)
          TextHeader2(
            text: title ?? '',
            key: keyTitle,
            textAlign: TextAlign.center,
          ),
        if (subTitle != null && subTitle!.isNotEmpty)
          const SizedBox(
            height: Spacings.medium,
          ),
        if (subTitle != null && subTitle!.isNotEmpty)
          TextH4(
            text: subTitle ?? '',
            color: Palette.grey50,
            key: keySubTitle,
            textAlign: TextAlign.center,
          ),
        if (bottomPadding != null && bottomPadding!)
          const SizedBox(
            height: Spacings.xLarge,
          ),
      ],
    );
  }
}
