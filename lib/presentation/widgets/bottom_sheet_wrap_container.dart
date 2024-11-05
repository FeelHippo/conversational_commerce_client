import 'package:flutter/material.dart';
import 'package:stadtplan/constants/bottom_sheet_constants.dart';
import 'package:stadtplan/themes/constants/spacings.dart';

class BottomSheetWrapContainer extends StatelessWidget {
  const BottomSheetWrapContainer({
    super.key,
    required this.child,
    this.heightTag = 'height_full',
    this.padding = const EdgeInsets.only(
      bottom: Spacings.medium,
      left: Spacings.medium,
      right: Spacings.medium,
      top: Spacings.large,
    ),
    this.childScrollViewNeeded = false,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool childScrollViewNeeded;
  final String heightTag;

  @override
  Widget build(BuildContext context) {
    return childScrollViewNeeded
        ? withoutScrollView(heightTag, context)
        : withScrollView(heightTag, context);
  }

  Widget withoutScrollView(String heightTag, BuildContext context) {
    return SizedBox(
      height: BottomSheetConstants.getHeight(heightTag, context),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  Widget withScrollView(String heightTag, BuildContext context) {
    return SizedBox(
      height: BottomSheetConstants.getHeight(heightTag, context),
      child: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
