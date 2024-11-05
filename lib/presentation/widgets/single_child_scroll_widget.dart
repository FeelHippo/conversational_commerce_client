import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:flutter/material.dart';

class SingleChildScrollWidget extends StatelessWidget {
  const SingleChildScrollWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.only(
      left: Spacings.medium,
      right: Spacings.medium,
      bottom: Spacings.medium,
      top: Spacings.xxxxLarge,
    ),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
